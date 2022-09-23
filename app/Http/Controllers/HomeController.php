<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index() {

        $categories = Category::all();
        $products = Product::with('discount')->with('price')->with('image')->get();

        $this->data['products'] = $products;
        $this->data['categories'] = $categories;
        return view('home', $this->data);
    }

    public function author() {
        return view('author', $this->data);
    }
}
