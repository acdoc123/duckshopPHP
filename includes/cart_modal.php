<!-- Delete -->
<div class="modal fade" id="delete">
  <div class="modal-dialog">
    <div class="modal-content rounded">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title"><b>Deleting...</b></h3>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="cart_delete.php">
          <input type="hidden" class='cartid' name="id">
          <div class="text-center">
            <p>
              DELETE PRODUCT FROM CART
            </p>
            <h2 class="bold productname"></h2>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat pull-left rounded" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
        <button type="submit" class="btn btn-danger btn-flat rounded" name="delete"><i class="fa fa-trash"></i> Delete</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Confirm Address -->
<div class="modal fade" id="confirm">
  <div class="modal-dialog">
    <div class="modal-content rounded">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title"><b><span class="productname"></span></b></h3>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="cart_edit.php">
          <input type="hidden" class="cartid" name="cartid">
          <input type="hidden" class="userid" name="userid">
          <div class="form-group">
            <label for="edit_quantity" class="col-sm-3 control-label">Quantity</label>

            <div class="col-sm-9">
              <input type="number" class="form-control rounded" id="edit_quantity" name="quantity">
            </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat pull-left rounded" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
        <button type="submit" class="btn btn-success btn-flat rounded" name="edit"><i class="fa fa-check-square-o"></i> Update</button>
        </form>
      </div>
    </div>
  </div>
</div>