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
        <form class="form-horizontal" method="POST" action="products_delete.php">
          <input type="hidden" class="prodid" name="id">
          <div class="text-center">
            <p>DELETE PRODUCT</p>
            <h2 class="bold name"></h2>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
        <button type="submit" class="btn btn-danger btn-flat" name="delete"><i class="fa fa-trash"></i> Delete</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Edit -->
<div class="modal fade" id="edit">
  <div class="modal-dialog modal-lg">
    <div class="modal-content rounded">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title"><b>Edit Product</b></h3>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="products_edit.php">
          <input type="hidden" class="prodid" name="id">
          <div class="form-group">
            <label for="edit_name" class="col-sm-1 control-label">Name</label>

            <div class="col-sm-5">
              <input type="text" class="form-control rounded" id="edit_name" name="name">
            </div>

            <label for="edit_category" class="col-sm-1 control-label">Category</label>

            <div class="col-sm-5">
              <select class="form-control rounded" id="edit_category" name="category">
                <option selected id="catselected"></option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="edit_price" class="col-sm-1 control-label">Price</label>

            <div class="col-sm-5">
              <input type="text" class="form-control rounded" id="edit_price" name="price">
            </div>
            <label for="edit_stock" class="col-sm-1 control-label">Stock</label>

            <div class="col-sm-5">
              <input type="number" class="form-control rounded" id="edit_stock" name="stock" min=0>
            </div>
          </div>
          <p><b>Description</b></p>
          <div class="form-group">
            <div class="col-sm-12">
              <textarea id="editor2" name="description" rows="10" cols="80"></textarea>
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