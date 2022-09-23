@extends('layouts.formPageLayout')

@section('title')
    Clocky shop - {{ $product->name }}
@endsection
@section('description') Display one product from clocky shop. @endsection
@section('main')
    <div class="cart-info hidden">
        <button class="close">&times;</button>
        <div class="row text-center">
            <h1>Products added to cart</h1>
        </div>
        <div class="row  justify-content-between">
            <div class="col-3">
                <a href="{{ route('home') }}"><button class="btn btn-sm cart-button">Go back to home</button></a>
            </div>

            <div class="col-3">
                <a href="{{ route('cart') }}"><button class="btn btn-sm cart-button">Check out cart</button></a>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row justify-content-center top-gap">
            <div class="col-4 ">
                <figure>
                    <img src="{{ asset('assets/images/'.$product->image->url) }}" alt="{{ $product->image->alt }}">
                    <figcaption>{{ $product->name }}</figcaption>
                </figure>
            </div>
            <div class="col-6 align-self-center">
                <div id="purchase-options" class="row justify-content-between">
                    <input type="number" min="0" value="1" class="col-4" id="number-of-products">
                    <div class="price col-4">{{ $product->price->amount }} &euro; </div>
                    <button class="btn btn-lg blue col-4" id="add-to-cart" data-id="{{ $product->id }}">Add to cart</button>
                </div>
            </div>
        </div>
        <div class="row border-top">
            <p>
                {{ $product->description }}
            </p>
        </div>
    </div>
@endsection
