@extends('layouts.formPageLayout')

@section('title')
    Clocky shop - Panel
@endsection
@section('description') Admin page for clocky shop. @endsection
@section('main')
    @csrf
    <div class="popup">
        <div id="product-edit">
            <button id="close">&times;</button>
            <from id="input-form">
                <input type="text" class="form-control" placeholder="Enter new name...">
                <select name="category" id="category" class="form-control">
                    <option value="" selected>Select Category</option>
                    @foreach($categories as $category)
                        <option value="{{ $category->id }}">{{ ucfirst($category->name) }}</option>
                    @endforeach
                </select>
                <select name="price" id="price" class="form-control">
                    <option value="">Select Price</option>
                    @foreach($prices as $price)
                        <option value="{{ $price->id }}">{{ $price->amount }} &euro;</option>
                    @endforeach
                </select>
                <select name="discount" id="discount" class="form-control">
                    <option value="">Select Discount</option>
                    @foreach($discounts as $discount)
                        <option value="{{ $discount->id }}">{{ ucfirst($discount->name) }} - {{ $discount->percent }}%</option>
                    @endforeach
                </select>
                <textarea name="description" id="description" cols="30" rows="10" class="form-control" placeholder="New description..."></textarea>
                <button class="btn btn-success">Submit</button>
            </from>
        </div>
    </div>
    <div id="display-msg" class="text-center row align-items-center hidden">
        Category could not be deleted
    </div>
    <div class="container-fluid row">
            <div class="col-2">
                <nav class="navbar navbar-expand-lg navbar-light bg-dark flex-column align-items-baseline">
                    <ul id="admin-nav">
                        <li class="nav-link link-light" id="products">Products</li>
                        <li class="nav-link link-light" id="categories">Categories</i> </li>
                        <li class="nav-link link-light" id="discounts">Discounts</li>
                        <li class="nav-link link-light" id="users">Users</li>
                    </ul>
                </nav>
            </div>
        <div class="col-1" id="insert-new"></div>
        <div class="col-8" id="admin-display">

        </div>
        </div>
    <div id="info" class="hidden">
        <select id="categories-hidden" class="form-control">
            <option value="" selected>Select Category</option>
            @foreach($categories as $category)
                <option value="{{ $category->id }}">{{ ucfirst($category->name) }}</option>
            @endforeach
        </select>
        <select id="prices-hidden" class="form-control">
            <option value="">Select Price</option>
            @foreach($prices as $price)
                <option value="{{ $price->id }}">{{ $price->amount }} &euro;</option>
            @endforeach
        </select>
        <select id="discounts-hidden" class="form-control">
            <option value="">Select Discount</option>
            @foreach($discounts as $discount)
                <option value="{{ $discount->id }}">{{ ucfirst($discount->name) }} - {{ $discount->percent }}%</option>
            @endforeach
        </select>
    </div>
@endsection
