@extends('layouts.formPageLayout')

@section('title')
    Clocky shop - Cart
@endsection
@section('description') Cart page for clocky shop. @endsection
@section('main')
   @csrf

    <div class="container-fluid">
        <div class="row justify-content-center" id="cart-container">
            <div class="col-9 cart-products">

            </div>
            <div class="col-2 text-center d-flex align-items-center justify-content-center">
                <button class="btn btn-success btn-lg" id="checkout">Checkout</button>
            </div>
        </div>

    </div>
@endsection
