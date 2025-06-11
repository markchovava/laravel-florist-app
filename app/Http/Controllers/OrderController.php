<?php

namespace App\Http\Controllers;


use App\Http\Resources\OrderItemResource;
use App\Http\Resources\OrderResource;
use App\Http\Resources\OrderUserResource;
use App\Http\Resources\ProductResource;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\OrderUser;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
/* PAYNOW */
use Paynow\Payments\Paynow;
/* PHPMailer */
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

class OrderController extends Controller
{

    public function index(Request $request){
        if(!empty($request->search)){
            $data = Order::where('order_no', 'LIKE', '%' . $request->search . '%')
                ->paginate(15);
        } else {
            $data = Order::orderBy('updated_at','desc')
                ->orderBy('order_no','asc')
                ->paginate(15);
        }

        return OrderResource::collection($data);
    }


    public function show($id){
        $data = Order::with(['order_user', 'orderitems'])->find($id);
        return new OrderResource($data);
    }

    public function showByUserId(Request $request){
        $id = Auth::user()->id;
        if(!empty($request->search)){
            $data = Order::with(['order_user', 'orderitems'])
                    ->where('user_id',$id)
                    ->where('order_no', 'LIKE', '%' . $request->search . '%')
                    ->orderBy('updated_at', 'desc')
                    ->paginate(15);
        } else {
            $data = Order::with(['order_user', 'orderitems'])
                    ->where('user_id', $id)
                    ->orderBy('updated_at', 'desc')
                    ->paginate(15);
        }
        return OrderResource::collection($data);

    }

    public function searchProductByName(Request $request){
        if(!empty($request->search) && $request->search !== ''){
            $data = Product::with(['user', 'categories'])
                ->where('name', 'LIKE', '%' . $request->search . '%')
                ->get();
        }
        return ProductResource::collection($data);
    }

    public function deliveryUpdate(Request $request, $id){
        $data = Order::find($id);
        $data->delivery_status = $request->delivery_status;
        $data->save();

        return response()->json([
            'message' => 'Saved Successfully.',
            'data' => new OrderResource($data),
        ]);

    }

    public function store(Request $request){
        /* ORDER */
        $code = rand(0, 10000000);
        $order = new Order();
        $order->order_no = 'REF' .  date('Ymd') . $code;
        $order->user_id = Auth::user()->id;
        $order->order_quantity = $request->cart['cart_quantity'];
        $order->order_total = $request->cart['cart_total'];
        $order->product_total = $request->cart['product_total'];
        $order->product_quantity = $request->cart['product_quantity'];
        $order->message = $request->cart['message'];
        $order->is_agree = $request->cart['is_agree'];
        $order->extra_total = $request->cart['extra_total'];
        $order->extra_quantity = $request->cart['extra_quantity'];
        $order->payment_method = $request->cart['payment_method'];
        $order->delivery_name = $request->cart['delivery_name'];
        $order->delivery_price = $request->cart['delivery_price'];
        $order->delivery_status = 'Processing';
        $order->created_at = now();
        $order->updated_at = now();
        $order->save();
        /* USER INFO */
        $order_user = $request->user;
        $user = new OrderUser();
        $user->order_id = $order->id;
        $user->user_id = Auth::user()->id;
        $user->first_name =  $order_user['first_name'];
        $user->last_name =  $order_user['last_name'];
        $user->name =   $order_user['first_name'] . ' ' . $order_user['last_name'];
        $user->phone =  $order_user['phone'];
        $user->email =  $order_user['email'];
        $user->address = $order_user['address'];
        $user->city =  $order_user['city'];
        $user->country =  $order_user['country'];
        $user->created_at = now();
        $user->updated_at = now();
        $user->save();
        /* ORDER-ITEM */
        if(!empty($request->items)){
            $items = $request->items;
            for($i=0; $i < count($items); $i++){
                $item = new OrderItem();
                $item->user_id = Auth::user()->id;
                $item->order_id = $order->id;
                $item->product_id = $items[$i]['product_id'];
                $item->product_name = $items[$i]['product_name'];
                $item->product_unit_price = $items[$i]['product_unit_price'];
                $item->product_total = $items[$i]['product_total'];
                $item->product_quantity = $items[$i]['product_quantity'];
                $item->orderitem_quantity = $items[$i]['cartitem_quantity'];
                $item->orderitem_total = $items[$i]['cartitem_total'];
                $item->save();  
            }
        }
        Cart::where('id', $request->cart['id'])->delete();
        CartItem::where('cart_id', $request->cart['id'])->delete();
        return response()->json([
            'message' => 'Saved Successfully.',
            'order' => new OrderResource($order),
            'orderitems' => OrderItemResource::collection($order),
            'order_user' => new OrderUserResource($order_user),
        ]);

    }

    public function storeAll(Request $request){
         
        $code = rand(0, 10000);
        $cart = $request->cart;
        $order = new Order();
        $order->order_no = 'REF' .  date('Ymd') . $code;
        $order->user_id = Auth::user()->id;
        $order->product_total = $cart['product_total'];
        $order->product_quantity = $cart['product_quantity'];
        $order->message = $cart['message'];
        $order->is_agree = $cart['is_agree'];
        $order->extra_total = !empty($cart['extra_total']) ? $cart['extra_total'] : 0;
        $order->extra_quantity = !empty($cart['extra_quantity']) ? $cart['extra_quantity'] : 0;
        $order->payment_method = $cart['payment_method'];
        $order->delivery_name = $cart['delivery_name'];
        $order->delivery_price = $cart['delivery_price'];
        $order->delivery_status = 'Processing';
        $order->order_quantity = (int)$order->product_quantity + (int)$order->extra_quantity;
        $order->order_total = $cart['cart_total'];
        $order->created_at = now();
        $order->updated_at = now();
        $order->save();
        
        $order_user = $request->user;
        $user = new OrderUser();
        $user->order_id = $order->id;
        $user->user_id = Auth::user()->id;
        $user->first_name =  $order_user['first_name'];
        $user->last_name =  $order_user['last_name'];
        $user->name =   $order_user['first_name'] . ' ' . $order_user['last_name'];
        $user->phone =  $order_user['phone'];
        $user->email =  $order_user['email'];
        $user->address = $order_user['address'];
        $user->city =  $order_user['city'];
        $user->country =  $order_user['country'];
        $user->created_at = now();
        $user->updated_at = now();
        $user->save();

        $auth = User::where('id', $user->user_id)->first();
        $auth->address = $order_user['address'];
        $auth->phone = $order_user['phone'];
        $auth->city = $order_user['city'];
        $auth->country = $order_user['country'];
        $auth->first_name = $order_user['first_name'];
        $auth->last_name = $order_user['last_name'];
        $auth->name = $order_user['first_name'] . ' ' . $order_user['last_name'];
        $auth->save();
        
        if(!empty($request->items)){
            $items = $request->items;
            for($i=0; $i < count($items); $i++){
                $item = new OrderItem();
                $item->user_id = Auth::user()->id;
                $item->order_id = $order->id;
                $item->product_id = $items[$i]['product_id'];
                $item->product_name = $items[$i]['product_name'];
                $item->product_unit_price = $items[$i]['product_unit_price'];
                $item->product_total = !empty($items[$i]['product_total']) ? $items[$i]['product_total'] : 0;
                $item->extra_name = $items[$i]['extra_name'];
                $item->extra_quantity = !empty($items[$i]['extra_quantity']) ? $items[$i]['extra_quantity'] : 0;
                $item->extra_total = !empty($items[$i]['extra_total']) ? $items[$i]['extra_total'] : 0;
                $item->product_quantity = !empty($items[$i]['product_quantity']) ? $items[$i]['product_quantity'] : 0;
                $item->orderitem_quantity = (int)$items[$i]['cartitem_quantity'];
                $item->orderitem_total = (int)$items[$i]['cartitem_total'];
                $item->save();     
            }
        }
        
        Cart::where('id', $cart['id'])->delete();
        CartItem::where('cart_id', $cart['id'])->delete();

        /* --------------------PAYNOW ---------------- */
        if($cart['payment_method'] == 'Paynow'){
            $paynow = new Paynow(
                env('PAYNOW_KEY'),
                env('PAYNOW_ID'),
                'https://www.google.com',
                'https://www.google.com',
                //'http://lunartechstore.co.zw/payment/update',
                // The return url can be set at later stages. You might want to do this if you want to pass data to the return url (like the reference of the transaction)
                //'http://lunartechstore.co.zw/track/order'
            ); 
            $order_total = $order->order_total / 100;
            $payment = $paynow->createPayment($order->order_no, env('PAYNOW_EMAIL')); 
            $payment->add('River Range Roses PBC', 1.0 );
            $response = $paynow->send($payment);
            if($response->success()) {
                // Or if you prefer more control, get the link to redirect the user to, then use it as you see fit
                $link = $response->redirectUrl();
                $pollUrl = $response->pollUrl();
                // Check the status of the transaction
                $status = $paynow->pollTransaction($pollUrl);
            }

            /* ----------------------PHPMAILER--------------------- */
            //Server settings
            /* $mail = new PHPMailer(true);

            try {
                //Server settings
                $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
                $mail->isSMTP();                                            //Send using SMTP
                $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
                $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
                $mail->Username   = 'markchovava@gmail.com';                     //SMTP username
                $mail->Password   = 'mark0410';                               //SMTP password
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
                $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

                //Recipients
                $mail->setFrom($auth->email, 'Mailer');
                $mail->addAddress($auth->email, $auth->name);     //Add a recipient
                //$mail->addAddress('ellen@example.com');               //Name is optional
                //$mail->addReplyTo('info@example.com', 'Information');
                //$mail->addCC('cc@example.com');
                //$mail->addBCC('bcc@example.com');

                //Attachments
                //$mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments
                //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name

                //Content
                $mail->isHTML(true);                                  //Set email format to HTML
                $mail->Subject = 'ORDER FROM River Range Florist and Gift Shop';
                $mail->Body    = 'Customer: ' . $auth->name . 
                                '<br />Email: ' . $auth->email .
                                '<br />Phone: ' . $auth->phone .
                ' <br /> has placed an order with, <br /> Reference number:' . $order->order_no . 
                ' <br /> Kindly login to the website to start processing the order.';
                $mail->AltBody = 'Customer: ' . $auth->name . 
                    ', Email: ' . $auth->email .
                    ', Phone: ' . $auth->phone .
                    ', has placed an order with, <br /> Reference number:' . $order->order_no . 
                    ', Kindly login to the website to start processing the order.';

                $mail->send();
                Log::info('Message has been sent');
            } catch (Exception $e) {
                Log::info("Message could not be sent. Mailer Error: {$mail->ErrorInfo}");
            }  */  

            return response()->json([
                'message' => 'Saved Successfully.',
                'order' => new OrderResource($order),
                'paynow_link' => !empty($link) ? $link : null,
            ]);
        }
        

    }

    public function delete($id){
        $order = Order::find($id);
        $order->delete();

        OrderUser::where('order_id', $id)->delete();
        OrderItem::where('order_id', $id)->delete();

        return response()->json([
            'message' => 'Deleted Successfully.',
        ]);
        
    }



}
