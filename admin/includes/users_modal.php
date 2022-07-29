<!-- Add -->
<div class="modal fade" id="addnew">
  <div class="modal-dialog">
    <div class="modal-content rounded">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title"><b>Add New User</b></h3>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="users_add.php" enctype="multipart/form-data">
          <div class="form-group">
            <label for="email" class="col-sm-3 control-label">Email</label>

            <div class="col-sm-9">
              <input type="email" class="form-control rounded" id="email" name="email" required>
            </div>
          </div>
          <div class="form-group">
            <label for="password" class="col-sm-3 control-label">Password</label>

            <div class="col-sm-9">
              <input type="password" class="form-control rounded" id="password" name="password" required>
            </div>
          </div>
          <div class="form-group">
            <label for="firstname" class="col-sm-3 control-label">Firstname</label>

            <div class="col-sm-9">
              <input type="text" class="form-control rounded" id="firstname" name="firstname" required>
            </div>
          </div>
          <div class="form-group">
            <label for="lastname" class="col-sm-3 control-label">Lastname</label>

            <div class="col-sm-9">
              <input type="text" class="form-control rounded" id="lastname" name="lastname" required>
            </div>
          </div>
          <div class="form-group">
            <label for="address" class="col-sm-3 control-label">Address</label>

            <div class="col-sm-9">
              <textarea class="form-control rounded" id="address" name="address"></textarea>
            </div>
          </div>
          <div class="form-group">
            <label for="contact" class="col-sm-3 control-label">Contact Info</label>

            <div class="col-sm-9">
              <input type="text" class="form-control rounded" id="contact" name="contact">
            </div>
          </div>
          <div class="form-group">
            <label for="photo" class="col-sm-3 control-label">Photo</label>

            <div class="col-sm-9">
              <input type="file" id="photo" name="photo">
            </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat pull-left rounded" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
        <button type="submit" class="btn btn-primary btn-flat rounded" name="add"><i class="fa fa-save"></i> Save</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Edit -->
<div class="modal fade" id="edit">
  <div class="modal-dialog">
    <div class="modal-content rounded">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title"><b>Edit User</b></h3>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="users_edit.php">
          <input type="hidden" class="userid" name="id">
          <div class="form-group">
            <label for="edit_email" class="col-sm-3 control-label">Email</label>

            <div class="col-sm-9">
              <input type="email" class="form-control rounded" id="edit_email" name="email">
            </div>
          </div>
          <div class="form-group">
            <label for="edit_password" class="col-sm-3 control-label">Password</label>

            <div class="col-sm-9">
              <input type="password" class="form-control rounded" id="edit_password" name="password">
            </div>
          </div>
          <div class="form-group">
            <label for="edit_firstname" class="col-sm-3 control-label">Firstname</label>

            <div class="col-sm-9">
              <input type="text" class="form-control rounded" id="edit_firstname" name="firstname">
            </div>
          </div>
          <div class="form-group">
            <label for="edit_lastname" class="col-sm-3 control-label">Lastname</label>

            <div class="col-sm-9">
              <input type="text" class="form-control rounded" id="edit_lastname" name="lastname">
            </div>
          </div>
          <div class="form-group">
            <label for="edit_address" class="col-sm-3 control-label">Address</label>

            <div class="col-sm-9">
              <textarea class="form-control rounded" id="edit_address" name="address"></textarea>
            </div>
          </div>
          <div class="form-group">
            <label for="edit_contact" class="col-sm-3 control-label">Contact Info</label>

            <div class="col-sm-9">
              <input type="text" class="form-control rounded" id="edit_contact" name="contact">
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
        <form class="form-horizontal" method="POST" action="users_delete.php">
          <input type="hidden" class="userid" name="id">
          <div class="text-center">
            <p>DELETE USER</p>
            <h2 class="bold fullname"></h2>
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

<!-- Update Photo -->
<div class="modal fade" id="edit_photo">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title"><b><span class="fullname"></span></b></h3>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="users_photo.php" enctype="multipart/form-data">
          <input type="hidden" class="userid" name="id">
          <div class="form-group">
            <label for="photo" class="col-sm-3 control-label">Photo</label>

            <div class="col-sm-9">
              <input type="file" id="photo" name="photo" required>
            </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat pull-left rounded" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
        <button type="submit" class="btn btn-success btn-flat rounded" name="upload"><i class="fa fa-check-square-o"></i> Update</button>
        </form>
      </div>
    </div>
  </div>
</div>


<!-- Activate -->
<div class="modal fade" id="activate">
  <div class="modal-dialog">
    <div class="modal-content rounded">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title"><b>Activating...</b></h3>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="users_activate.php">
          <input type="hidden" class="userid" name="id">
          <div class="text-center">
            <p>ACTIVATE USER</p>
            <h2 class="bold fullname"></h2>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat pull-left rounded" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
        <button type="submit" class="btn btn-success btn-flat rounded" name="activate"><i class="fa fa-check"></i> Activate</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Disable -->
<div class="modal fade" id="disable">
  <div class="modal-dialog">
    <div class="modal-content rounded">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title"><b>Disabling...</b></h3>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="POST" action="users_disable.php">
          <input type="hidden" class="userid" name="id">
          <div class="text-center">
            <p>DISABLE USER</p>
            <h2 class="bold fullname"></h2>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat pull-left rounded" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
        <button type="submit" class="btn btn-danger btn-flat rounded" name="disable"><i class="fa fa-check"></i> Disable</button>
        </form>
      </div>
    </div>
  </div>
</div>