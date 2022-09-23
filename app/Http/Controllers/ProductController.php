<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function filteredProducts(Request $request) {
        try {
            $categoryIds = $request->get('categoryIds');
            $sortType = $request->get('sortType');
            $search = $request->get('searchTerm');
            if($sortType !== 'asc' && $sortType !== 'desc')  {
                $sortType = 'asc';
            }
            $products = Product::select('products.*', 'prices.amount as amount')
                ->join('prices', 'products.price_id', '=', 'prices.id')
                ->with('image')
                ->with('category')
                ->with('discount')
                ->when($categoryIds, function($query, $categoryIds) {
                    $query->whereIn('category_id', $categoryIds);
                })
                ->when($search, function($query, $search) {
                    $query->where('name', 'LIKE',  "%{$search}%");
                })
                ->orderBy('amount', $sortType)
                ->get();

            return json_encode($products);

        } catch(\PDOException $exception) {
            //TODO
            return $exception;
        }

    }

    public function index($id) {
        try {
            $product = Product::find($id);
            $this->data['product'] = $product;
            return view('singleProduct', $this->data);
        } catch (\PDOException $exception) {

        }
    }

    public function tryDeleteProduct(Request $request) {
        try {
            $id = $request->get('id');
            $product = Product::find($id);
            $success = $product->delete();
            if($success) {
                return ['message' => 'success'];
            } else {
                http_response_code(500);
            }

        } catch (\PDOException $exception) {

        }
    }

    public function productsByIds(Request $request) {
        $ids = $request->get('ids');
        $products = Product::whereIn('id', $ids)
            ->with('category')
            ->with('discount')
            ->with('price')
            ->with('image')
            ->get();
        return json_encode($products);
    }
}
