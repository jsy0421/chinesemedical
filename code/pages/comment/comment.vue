<template>
	<view class="container">
		<view class="tui-cells">
			<textarea :value="content" type="text" class="tui-textarea" placeholder="发表你的评论..." maxlength="500"
				placeholder-class="tui-phcolor-color" @input="inputContent" />
				
			<view class="tui-textarea-counter">{{ content.length }}/500</view>
		</view>
		<view class="tui-box-upload">
			<tui-upload :value="img" @complete="result" @remove="remove"></tui-upload>
		</view>
		<view class="tui-cmt-btn">
			<tui-button shape="circle" @click="up()">发表</tui-button>
		</view>
		<tui-toast ref="toast"></tui-toast>
	</view>
</template>

<script>
	import tuiIcon from "../../component/thorui/tui-icon/tui-icon.vue"
	import tuiButton from "../../component/thorui/tui-button/tui-button.vue"
	import tuiToast from '../../component/thorui/tui-toast/tui-toast.vue';
	import tuiUpload from '../../component/thorui/tui-upload/tui-upload.vue'
	export default {
		components: {
			tuiIcon,
			tuiButton,
			tuiToast,
			tuiUpload
		},
		data() {
			return {
				content: '',
				img:'' //初始化图片
			};
		},
		onLoad() {
			setTimeout(()=>{
				this.img=['../../static/news/1.jpg']
			},200)
		},
		methods: {
			result: function(e) {
				console.log(e)
				this.img = e.imgArr;
			},
			remove: function(e) {
				//移除图片
				console.log(e)
				let index = e.index
			},
			inputContent: function(e) {
				this.content = e.detail.value;
			},
			up: function() {
				console.log(this.img);
				var _this = this;
				if (_this.content === "") {
					let params = {
						title: "内容不能为空"
					};
					this.$refs.toast.show(params);
				}
				else if (_this.img === "") {
					let params = {
						title: "头像不能为空"
					};
					this.$refs.toast.show(params);
				}
				else {
					uni.request({
						url: 'http://192.168.43.90:3333/addComment',
						data: {
							content: _this.content,
							img: _this.img
						},
						method: 'GET',
						success: (res) => {
							if (res.statusCode == 200) {
								_this.userInfo = res.data;
								if (_this.userInfo.status == 1) {
									//LOGIN success
									let params = {
										title: "发布成功",
										imgUrl: "../../static/toast/check-circle.png",
										icon: true
									};
									this.$refs.toast.show(params);
									setTimeout(function() {
										uni.reLaunch({
											url: '../../pages/commentReply/commentReply'
										})
									}, 2000);
								} else {
									let params = {
										title: _this.userInfo.msg,
									};
									this.$refs.toast.show(params);
								}
							} else {
								let params = {
									title: "出现错误，请稍后再试"
								};
								_this.$refs.toast.show(params);
							}
							console.log(res);
						},
						fail: (err) => {
							console.log(err);
						}
					})
				}
			}
		}
	};
</script>

<style>
	page {
		background: #fff;
		color: #333;
	}

	.container {
		padding: 30rpx;
		box-sizing: border-box;
	}

	.tui-cells {
		border-radius: 4rpx;
		height: 280rpx;
		box-sizing: border-box;
		padding: 20rpx 20rpx 0 20rpx;
		position: relative;
	}

	.tui-cells::after {
		content: '';
		position: absolute;
		height: 200%;
		width: 200%;
		border: 1px solid #e6e6e6;
		transform-origin: 0 0;
		-webkit-transform-origin: 0 0;
		-webkit-transform: scale(0.5);
		transform: scale(0.5);
		left: 0;
		top: 0;
		border-radius: 8rpx;
		pointer-events: none;
	}

	.tui-textarea {
		height: 210rpx;
		width: 100%;
		color: #666;
		font-size: 28rpx;
	}

	.tui-phcolor-color {
		color: #ccc !important;
	}

	.tui-textarea-counter {
		font-size: 24rpx;
		color: #999;
		text-align: right;
		height: 40rpx;
		line-height: 40rpx;
		padding-top: 4rpx;
	}

	.tui-enclosure {
		display: flex;
		align-items: center;
		padding: 26rpx 10rpx;
		box-sizing: border-box;
	}

	.tui-cmt-btn {
		margin-top: 60rpx;
	}
	.tui-box-upload {
		padding-left: 25rpx;
		box-sizing: border-box;
	}
</style>
