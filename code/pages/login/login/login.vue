<template>
	<view class="container">
		<!-- #ifndef MP -->
		<view class="tui-status-bar"></view>
		<view class="tui-header">
			<view class="tui-page-title">登录</view>
			<tui-icon name="shut" :size="26" @click="back"></tui-icon>
		</view>
		<!-- #endif -->
		<view class="tui-form">
			<view class="tui-view-input">
				<tui-list-cell :hover="false" :lineLeft="false" backgroundColor="transparent">
					<view class="tui-cell-input">
						<tui-icon name="mobile" color="#6d7a87" :size="20"></tui-icon>
						<input :adjust-position="false" :value="mobile" placeholder="请输入手机号"
							placeholder-class="tui-phcolor" type="number" maxlength="11" @input="inputMobile" />
						<view class="tui-icon-close" v-show="mobile" @tap="clearInput(1)">
							<tui-icon name="close-fill" :size="16" color="#bfbfbf"></tui-icon>
						</view>
					</view>
				</tui-list-cell>
				<tui-list-cell :hover="false" :lineLeft="false" backgroundColor="transparent">
					<view class="tui-cell-input">
						<tui-icon name="pwd" color="#6d7a87" :size="20"></tui-icon>
						<input :adjust-position="false" :value="password" placeholder="请输入密码" :password="true"
							placeholder-class="tui-phcolor" type="text" maxlength="36" @input="inputPwd" />
						<view class="tui-icon-close" v-show="password" @tap="clearInput(2)">
							<tui-icon name="close-fill" :size="16" color="#bfbfbf"></tui-icon>
						</view>
					</view>
				</tui-list-cell>
			</view>
			<view class="tui-cell-text">
				<view class="tui-color-primary" hover-class="tui-opcity" :hover-stay-time="150" @tap="href(1)">忘记密码？
				</view>
				<view hover-class="tui-opcity" :hover-stay-time="150">
					没有账号？
					<text class="tui-color-primary" @tap="href(2)">注册</text>
				</view>
			</view>
			<view class="tui-btn-box">
				<view class="tui-btn-btm">
					<tui-button :disabledGray="true" :disabled="disabled" :shadow="true" shape="circle"
						@click="login()">登录</tui-button>
				</view>
			</view>
			<tui-toast ref="toast"></tui-toast>
		</view>
		<view class="tui-login-way" v-if="!popupShow">
			<view hover-class="tui-opcity" :hover-stay-time="150" @tap="showOtherLogin">其他方式登录</view>
		</view>
		<tui-bottom-popup :mask="false" backgroundColor="transparent" :show="popupShow">
			<view class="tui-auth-login">
				<view class="tui-icon-platform" hover-class="tui-opcity" :hover-stay-time="150">
					<image src="../../../static/share/icon_qq.png" class="tui-login-logo"></image>
				</view>
				<view class="tui-icon-platform" hover-class="tui-opcity" :hover-stay-time="150">
					<image src="../../../static/share/icon_wechat.png" class="tui-login-logo"></image>
				</view>
				<view class="tui-icon-platform" hover-class="tui-opcity" hover-stay-time="150">
					<image src="../../../static/share/icon_sina.png" class="tui-login-logo"></image>
				</view>
			</view>
		</tui-bottom-popup>
	</view>
</template>

<script>
	import tuiIcon from '../../../component/thorui/tui-icon/tui-icon.vue';
	import tuiListCell from '../../../component/thorui/tui-list-cell/tui-list-cell.vue';
	import tuiButton from '../../../component/thorui/tui-button/tui-button.vue';
	import tuiBottomPopup from '../../../component/thorui/tui-bottom-popup/tui-bottom-popup.vue'
	import tuiToast from '../../../component/thorui/tui-toast/tui-toast.vue';
	export default {
		components: {
			tuiIcon,
			tuiListCell,
			tuiButton,
			tuiBottomPopup,
			tuiToast
		},
		computed: {
			disabled: function() {
				let bool = true;
				if (this.mobile && this.password) {
					bool = false;
				}
				return bool;
			}
		},
		data() {
			return {
				mobile: '',
				password: '',
				popupShow: false,
				show: false
			};
		},
		methods: {
			back() {
				uni.switchTab({
					url: '../../user/user'
				})
			},
			inputMobile: function(e) {
				this.mobile = e.detail.value;
			},
			inputPwd: function(e) {
				this.password = e.detail.value;
			},
			clearInput: function(type) {
				if (type == 1) {
					this.mobile = '';
				} else {
					this.password = '';
				}
			},
			href: function(type) {
				let url = '../../../pages/login/forgetPwd/forgetPwd';
				if (type == 2) {
					url = '../../../pages/login/reg/reg';
				}
				console.log(url);
				uni.navigateTo({
					url: url
				})
			},
			showOtherLogin: function() {
				//打开后 不再关闭
				this.popupShow = true;
			},
			login: function() {
				var _this = this;
				if (_this.mobile.length != 11) {
					let params = {
						title: "请正确输入手机号"
					};
					this.$refs.toast.show(params);
				} else {
					uni.request({
						url: 'http://192.168.43.90:3333/login',
						data: {
							phoneNumber: _this.mobile,
							password: _this.password
						},
						method: 'GET',
						success: (res) => {
							if (res.statusCode == 200) {
								_this.userInfo = res.data;
								if (_this.userInfo.status == 1) {
									//LOGIN success
									let params = {
										title: _this.userInfo.msg,
										imgUrl: "../../../static/toast/check-circle.png",
										icon: true
									};
									this.$refs.toast.show(params);
									setTimeout(function() {
										uni.reLaunch({
											url: '../../../pages/user/user?id=' + _this
												.mobile
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

<style lang="scss">
	page {
		background-color: #FFFFFF;
	}

	.container {
		.tui-status-bar {
			width: 100%;
			height: var(--status-bar-height);
		}

		.tui-header {
			width: 100%;
			padding: 40rpx;
			display: flex;
			align-items: center;
			justify-content: space-between;
			box-sizing: border-box;
		}

		.tui-page-title {
			width: 100%;
			font-size: 48rpx;
			font-weight: bold;
			color: $uni-text-color;
			line-height: 42rpx;
			padding: 40rpx;
			box-sizing: border-box;
		}

		.tui-form {
			padding-top: 50rpx;

			.tui-view-input {
				width: 100%;
				box-sizing: border-box;
				padding: 0 40rpx;

				.tui-cell-input {
					width: 100%;
					display: flex;
					align-items: center;
					padding-top: 48rpx;
					padding-bottom: $uni-spacing-col-base;

					input {
						flex: 1;
						padding-left: $uni-spacing-row-base;
					}

					.tui-icon-close {
						margin-left: auto;
					}
				}
			}

			.tui-cell-text {
				width: 100%;
				padding: $uni-spacing-col-lg $uni-spacing-row-lg;
				box-sizing: border-box;
				font-size: $uni-font-size-sm;
				color: $uni-text-color-grey;
				display: flex;
				align-items: center;
				justify-content: space-between;

				.tui-color-primary {
					color: $uni-color-primary;
				}
			}

			.tui-btn-box {
				width: 100%;
				padding: 0 $uni-spacing-row-lg;
				box-sizing: border-box;
				margin-top: 80rpx;
			}
		}

		.tui-login-way {
			width: 100%;
			font-size: 26rpx;
			color: $uni-color-primary;
			display: flex;
			justify-content: center;
			position: fixed;
			left: 0;
			bottom: 80rpx;

			view {
				padding: 12rpx 0;
			}
		}

		.tui-auth-login {
			width: 100%;
			display: flex;
			align-items: center;
			justify-content: center;
			padding-bottom: 80rpx;
			padding-top: 20rpx;

			.tui-icon-platform {
				width: 90rpx;
				height: 90rpx;
				display: flex;
				align-items: center;
				justify-content: center;
				position: relative;
				margin-left: 40rpx;

				&::after {
					content: '';
					position: absolute;
					width: 200%;
					height: 200%;
					transform-origin: 0 0;
					transform: scale(0.5, 0.5) translateZ(0);
					box-sizing: border-box;
					left: 0;
					top: 0;
					border-radius: 180rpx;
					border: 1rpx solid $uni-text-color-placeholder;
				}
			}

			.tui-login-logo {
				width: 60rpx;
				height: 60rpx;
			}
		}
	}
</style>
