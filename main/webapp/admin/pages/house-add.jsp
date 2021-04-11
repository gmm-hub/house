<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<div class="modal fade" id="myModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">添加房源</h4>
			</div>
			<div class="modal-body">
				<form id="houseForm" action="" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="title">房屋标题</label>
						<input type="text" class="form-control" id="title" placeholder="title" name="title" required="required">
					</div>
					<div class="form-group">
						<label for="model">房型</label>
						<input type="text" class="form-control" id="model" placeholder="（几室几厅）" name="model">
					</div>
					<div class="form-group">
						<label for="area">房屋面积</label>
						<input type="text" class="form-control" id="area" placeholder="area" name="area" required="required">
					</div>
					<div class="form-group">
						<label for="type">房屋出租方式</label>
						<select class="form-control" id="type" name="type">
							<option value="整租">整租</option>
							<option value="合租">合租</option>
						</select>
					</div>
					<div class="form-group">
						<label for="price">房屋价格</label>
						<input type="text" class="form-control" id="price" placeholder="price" name="price" required="required">
					</div>
					<div class="form-group">
						<label for="address">房屋地址</label>
						<input type="text" class="form-control" id="address" placeholder="address" name="address" required="required">
					</div>
					<div class="form-group">
						<label for="image">房屋图片</label>
						<img id="pic" width="100" height="100" />
						<input type="file" class="form-control" id="image" placeholder="photo" name="file" onchange="showPreview(this)">
					</div>
					<div class="form-group">
						<label for="orientation">房屋朝向</label>
						<select class="form-control" id="orientation" name="orientation">
							<option value="南北">南北</option>
							<option value="南">南</option>
							<option value="东南">东南</option>
							<option value="东">东</option>
							<option value="西南">西南</option>
							<option value="北">北</option>
							<option value="西">西</option>
							<option value="东北">东北</option>
							<option value="西北">西北</option>
						</select>
					</div>
					<div class="form-group">
						<label for="releaseTime">房屋发布时间</label>
						<input type="date" class="form-control" id="releaseTime" placeholder="create_time" name="releaseTime">
					</div>
					<div class="form-group">
						<label for="floor">房屋楼层</label>
						<input type="text" class="form-control" id="floor" placeholder="floor" name="floor" required="required">
					</div>
					<div class="form-group">
						<label for="detail">房屋描述</label>
						<input type="text" class="form-control" id="detail" placeholder="detail" name="detail" required="required">
					</div>
					<div class="form-group">
						<label for="linkPeople">房源联系人</label>
						<input type="text" class="form-control" id="linkPeople" placeholder="linkPeople" name="linkPeople" required="required">
					</div>
					<div class="form-group">
						<label for="linkPhone">联系电话</label>
						<input type="text" class="form-control" id="linkPhone" placeholder="linkPhone" name="linkPhone" required="required">
					</div>
					<button type="submit" class="btn btn-success">提交</button>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//将文件流以url形式读取，实现图片实时显示：
	function showPreview(source){
		var file = source.files[0];
		if(window.FileReader){
			var fr = new FileReader();
			fr.onloadend = function(e){
				document.getElementById("pic").src=e.target.result;
			}
			fr.readAsDataURL(file);
		}
	}
</script>
