<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="/">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shopping Cart</p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<!-- Cart Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <div class="col-lg-8 table-responsive mb-5">
            <table class="table table-bordered text-center mb-0">
                <thead class="bg-secondary text-dark">
                <tr>
                    <th>Products</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Remove</th>
                    <th> &nbsp; &nbsp;  Save &nbsp; &nbsp;   </th>
                </tr>
                </thead>
                <tbody class="align-middle">
                <c:forEach var="obj" items="${list}">
                    <form id="saveAndDelete_form${obj.id}">
                    <input type="hidden" name="id" value="${obj.id}">
                    <input type="hidden" name="cust_id" value="${logincust.id}">

                    <td class="align-middle">
                        <a href="/item/detail?id=${obj.item_id}">
                            <img src="/uimg/${obj.item_imgname}" alt="" style="width: 50px">
                                ${obj.item_name}
                        </a>
                    </td>
                    <td  class="align-middle">
                        <fmt:formatNumber value="${obj.item_price}" pattern="###,###원" />
                    </td>
                    <td class="align-middle">
                        <div class="input-group quantity mx-auto form-group" style="width: 100px;">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-sm btn-primary btn-minus" id="minus_btn${obj.id}" >
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input id="cnt${obj.id}" type="text" class="form-control form-control-sm bg-secondary text-center" name="cnt" value="${obj.cnt}">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-sm btn-primary btn-plus" id="plus_btn${obj.id}">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                    </td>
                    <td class="align-middle">
                        <input  pattern="###,###원" readonly id="total${obj.id}" type="text" class="form-control form-control-sm bg-secondary text-center" name="total" value="${obj.cnt*obj.item_price}">
                    </td>
                    <td class="align-middle form-group">
                            <button type="submit" formaction="/cart/delete" formmethod="post" class="btn btn-sm btn-primary"><i class="fa fa-times"></i></button>
                    </td>

                    <td class="align-middle form-group">
                          <button type="submit" formaction="/cart/update" formmethod="get" class="btn btn-sm btn-primary"><i class="fa fa-check"></i></button>
                    </td>
                    </form>
                </tr>

                    <script>
                        $('#plus_btn${obj.id}').on('click', function () {
                            var oldValue = $('#cnt${obj.id}').val();
                            var newVal = parseFloat(oldValue) + 1;
                            $('#cnt${obj.id}').val(newVal); //cnt 수량 +1
                            $('#total${obj.id}').val(($('#cnt${obj.id}').val())*(${obj.item_price}));
                        });
                        $('#minus_btn${obj.id}').on('click', function () {
                            var oldValue = $('#cnt${obj.id}').val();
                            var newVal = parseFloat(oldValue) - 1;
                            if (oldValue == 0) {
                                newVal = 0;
                            }
                            $('#cnt${obj.id}').val(newVal); //cnt 수량 -1
                            $('#total${obj.id}').val(($('#cnt${obj.id}').val())*(${obj.item_price}));
                        });
                        $('#cnt${obj.id}').change(function (){
                            $('#total${obj.id}').val(($('#cnt${obj.id}').val())*(${obj.item_price})); //cnt 변경 될때마다 total 변경
                        })


                    </script>

                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-lg-4">
            <form class="mb-5" action="">
                <div class="input-group">
                    <input type="text" class="form-control p-4" placeholder="Coupon Code">
                    <div class="input-group-append">
                        <button class="btn btn-primary">Apply Coupon</button>
                    </div>
                </div>
            </form>
            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                </div>
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3 pt-1">
                        <h6 class="font-weight-medium">Subtotal</h6>
                        <h6 class="font-weight-medium">$150</h6>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Shipping</h6>
                        <h6 class="font-weight-medium">$10</h6>
                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <div class="d-flex justify-content-between mt-2">
                        <h5 class="font-weight-bold">Total</h5>
                        <h5 class="font-weight-bold">$160</h5>
                    </div>
                    <button class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cart End -->


