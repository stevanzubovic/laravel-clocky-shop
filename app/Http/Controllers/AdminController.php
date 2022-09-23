<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Discount;
use App\Models\Price;
use App\Models\Product;
use App\Models\User;
use http\Client\Response;
use Illuminate\Http\Request;
use phpDocumentor\Reflection\Exception\PcreException;

class AdminController extends Controller
{
    public function index() {

        $this->data['products'] = Product::all();
        $this->data['categories'] = Category::all();
        $this->data['prices'] = Price::all();
        $this->data['discounts'] = Discount::all();
        return view('admin', $this->data);
    }

    public function getDiscounts() {
        return json_encode(Discount::all());
    }

    public function getUsers() {
        return json_encode(User::all());
    }

    public function getCategories() {
        return json_encode(Category::all());
    }

    public function deleteCategory(Request $request) {
        try {
            $id = $request->get('id');
            $category = Category::find($id);
             if($category->delete()){
                 return ['message' => 'Category deleted'];
             }

        } catch (\PDOException $exception) {
           return response()->json(['message' => 'Category could not be deleted'],403);
        }
    }

    public function deleteUser(Request $request) {
        try {
            $user = User::find($request->get('id'));
            $user->delete();
            return response()->json(['message' => 'User deleted'],200);
        } catch (\PDOException $exception) {
            return response()->json(['message' => 'User could not be deleted'],403);
        }

    }

    public function tryCreateNewProduct(Request $request) {
        try {
            $product = new Product();

            $product->name = $request->get('name');
            $product->discount_id = $request->get('discount');
            $product->price_id = $request->get('price');
            $product->description = $request->get('description');
            $product->category_id = $request->get('category');
            $product->image_id = 1;

            if($product->save()) {
                return ['message' => 'Product created successfully'];
            } else {
                //TODO redirect to error page
            }

        } catch (\PDOException $exception) {

        }
    }

    public function createCategory(Request $request) {
        try {
            $category = new Category();
            $category->name = $request->get('name');
            return $category->save();
        } catch (\PDOException $exception) {
            return response()->json(['message' => 'Category could not be created'],503);
        }
    }

    public function tryDeleteDiscount(Request $request) {
        try {
            $id = $request->get('id');
            $discount = Discount::find($id);
            if($discount->delete()) {
                return response()->json(['message' => 'Discount deleted'],200);
            }
        } catch (\PDOException $exception) {
            return response()->json(['message' => 'Discount could not be deleted'],403);
        }
    }

    public function createDiscount(Request $request) {
        try {
            $discount = new Discount();
            $discount->name = $request->get('name');
            $discount->percent = $request->get('percent');
            $discount->save();
            return response()->json(['message' => 'Discount created'],200);
        } catch (\PDOException $exception) {
            return response()->json(['message' => 'Discount could not be created'],503);
            //return $exception;
        }
    }

    public function editDiscount(Request $request) {
        try {
            $discount = Discount::find($request->get('id'));
            $discount->name = $request->get('name');
            $discount->percent = $request->get('percent');
            $discount->save();
            return response()->json(['message' => 'Discount edited'],200);
        } catch (\PDOException $exception) {
            return response()->json(['message' => 'Discount could not be edited'],503);
        }

    }

    public function editProduct(Request $request) {
        try {
            $product = Product::find($request->get('id'));
            $product->name = $request->get('name');
            $product->category_id = $request->get('category');
            $product->price_id = $request->get('price');
            $product->discount_id = $request->get('discount');
            $product->description = $request->get('description');
            $product->save();
            return response()->json(['message' => 'Product edited'],200);
        } catch (\PDOException $exception) {
            return response()->json(['message' => 'Could not edit product'],503);
        }
    }

    public function editCategory(Request $request) {
        try {
            $category = Category::find($request->get('id'));
            $category->name = $request->get('name');
            $category->save();
            return response()->json(['message' => 'Category edited'],200);
        } catch(\PDOException $exception) {
            return response()->json(['message' => 'Could not edit category'],503);
        }



    }
}
