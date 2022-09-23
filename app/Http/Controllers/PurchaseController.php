<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Receipt;
use Illuminate\Http\Request;

class PurchaseController extends Controller
{
    public function createPurchase(Request $request) {
        try {
            if (session()->has('user')) {
                $userId = session()->get('user')->id;
                $order = new Order();
                $order->user_id = $userId;
                $order->save();
                $products = $request->get('data');
                foreach ($products as $product) {
                    $receipt = new Receipt();
                    $receipt->product_id = $product['id'];
                    $receipt->quantity = $product['quantity'];
                    $receipt->order_id = $order->id;
                    $receipt->save();
                }
                return response()->json(['message' => 'Thank you for shopping with us'],200);
            }
            return response()->json(['message' => 'Thank you for shopping with us'],200);
        } catch(\PDOException $exception) {
                return response()->json(['message' => 'Thank you for shopping with us'],500);
                //return $exception;
        }

    }
}
