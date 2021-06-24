<template>
	<view class="container">
		<view class="tui-status-bar"></view>
		<view class="tui-header">
			<view class="tui-page-title">注册</view>
			<tui-icon name="shut" :size="26" @click="back"></tui-icon>
		</view>
		<view class="tui-form">
			<view class="tui-view-input">
				<tui-list-cell :hover="false" :lineLeft="false" backgroundColor="transparent">
					<view class="tui-cell-input">
						<tui-icon name="mobile" color="#6d7a87" :size="20"></tui-icon>
						<input :value="mobile" placeholder="请输入手机号" placeholder-class="tui-phcolor" type="number"
							maxlength="11" @input="inputMobile" />
						<view class="tui-icon-close" v-show="mobile" @tap="clearInput(1)">
							<tui-icon name="close-fill" :size="16" color="#bfbfbf"></tui-icon>
						</view>
					</view>
				</tui-list-cell>
				<tui-list-cell :hover="false" :lineLeft="false" backgroundColor="transparent">
					<view class="tui-cell-input">
						<tui-icon name="shield" color="#6d7a87" :size="20"></tui-icon>
						<input :value="sendCode" placeholder="请输入验证码" placeholder-class="tui-phcolor" type="text"
							maxlength="6" @input="inputCode" />
						<view class="tui-btn-send" :class="{ 'tui-gray': isSend }"
							:hover-class="isSend ? '' : 'tui-opcity'" :hover-stay-time="150" @click="btnSend()">
							{{ btnText }}
						</view>
					</view>
				</tui-list-cell>
				<tui-list-cell :hover="false" :lineLeft="false" backgroundColor="transparent">
					<view class="tui-cell-input">
						<tui-icon name="pwd" color="#6d7a87" :size="20"></tui-icon>
						<input :value="password" placeholder="请输入密码" :password="true" placeholder-class="tui-phcolor"
							type="text" maxlength="40" @input="inputPwd" />
						<view class="tui-icon-close" v-show="password" @tap="clearInput(2)">
							<tui-icon name="close-fill" :size="16" color="#bfbfbf"></tui-icon>
						</view>
					</view>
				</tui-list-cell>
			</view>
			<view class="tui-btn-box">
				<tui-button :disabledGray="true" :disabled="disabled" :shadow="true" shape="circle" @click="reg()">注册
				</tui-button>
			</view>
			<tui-toast ref="toast"></tui-toast>
			<view class="tui-cell-text">
				注册代表同意相关协议
			</view>
		</view>
	</view>
</template>

<script>
	import tuiIcon from '../../../component/thorui/tui-icon/tui-icon.vue';
	import tuiListCell from '../../../component/thorui/tui-list-cell/tui-list-cell.vue';
	import tuiButton from '../../../component/thorui/tui-button/tui-button.vue';
	import tuiToast from '../../../component/thorui/tui-toast/tui-toast.vue';
	export default {
		components: {
			tuiIcon,
			tuiListCell,
			tuiButton,
			tuiToast
		},
		computed: {
			disabled: function() {
				let bool = true;
				if (this.mobile && this.sendCode && this.password) {
					bool = false;
				}
				return bool;
			}
		},
		data() {
			return {
				mobile: '',
				password: '',
				code: '',
				sendCode: '',
				isSend: false,
				btnText: '获取验证码' //倒计时格式：(60秒)
			};
		},
		methods: {
			back() {
				uni.navigateTo({
					url: '../login/login'
				})
			},
			inputCode(e) {
				this.sendCode = e.detail.value;
			},
			inputMobile: function(e) {
				this.mobile = e.detail.value;
			},
			inputPwd: function(e) {
				this.password = e.detail.value;
			},
			clearInput(type) {
				if (type == 1) {
					this.mobile = '';
				} else {
					this.password = '';
				}
			},
			reg: function() {
				var _this = this;
				console.log(_this.mobile);
				console.log(_this.password);
				if (_this.mobile.length != 11) {
					let params = {
						title: "请输入正确的手机号"
					};
					_this.$refs.toast.show(params);
				} else if (_this.code != _this.sendCode) {
					let params = {
						title: "验证码错误，请重新获取验证码"
					};
					_this.$refs.toast.show(params);
				} else {
					uni.request({
						url: 'http://192.168.43.90:3333/reg',
						data: {
							phoneNumber: _this.mobile,
							password: _this.password
						},
						method: 'GET',
						success: (res) => {
							if (res.statusCode == 200) {
								_this.regInfo = res.data;
								if (_this.regInfo.status == 1) {
									let params = {
										title: "注册成功，请重新登录",
										imgUrl: "../../../static/toast/check-circle.png",
										icon: true
									};
									_this.$refs.toast.show(params);
									setTimeout(function() {
										uni.redirectTo({
											url: '../../../pages/login/login/login'
										})
									}, 2000);
								} else {
									let params = {
										title: res.data.msg
									};
									_this.$refs.toast.show(params);
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

			},
			getRandom: function(u) {
				let rnd = '';
				u = u || 6;
				for (var i = 0; i < u; i++) {
					rnd += Math.floor(Math.random() * 10);
				}
				return rnd;
			},
			doLoop: function(seconds) {
				let code = this.getRandom(4);
				let params = {
					title: "您本次的验证码是：" + code,
					icon: false
				};
				this.$refs.toast.show(params);
				seconds = seconds ? seconds : 30;
				this.btnText = seconds + 's后获取';
				this.code = code;
				let countdown = setInterval(() => {
					if (seconds > 0) {
						this.btnText = seconds + 's后获取';
						--seconds;
					} else {
						this.btnText = '获取验证码';
						this.disabled = false;
						this.type = 'primary';
						clearInterval(countdown);
					}
				}, 1000);
			},
			btnSend: function() {
				if (this.mobile.length === 11) {
					this.btnText = '请稍候...';
					this.type = 'gray';
					setTimeout(() => {
						this.doLoop(30);
					}, 500);
				} else {
					let params = {
						title: '请正确输入手机号',
						icon: false
					};
					this.$refs.toast.show(params);
				}
			},
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

					.tui-btn-send {
						width: 156rpx;
						text-align: right;
						flex-shrink: 0;
						font-size: $uni-font-size-base;
						color: $uni-color-primary;
					}

					.tui-gray {
						color: $uni-text-color-placeholder;
					}
				}
			}

			.tui-cell-text {
				width: 100%;
				padding: 40rpx $uni-spacing-row-lg;
				box-sizing: border-box;
				font-size: $uni-font-size-sm;
				color: $uni-text-color-grey;
				display: flex;
				align-items: center;

				.tui-color-primary {
					color: $uni-color-primary;
					padding-left: $uni-spacing-row-sm;
				}
			}

			.tui-btn-box {
				width: 100%;
				padding: 0 $uni-spacing-row-lg;
				box-sizing: border-box;
				margin-top: 80rpx;
			}
		}
	}
</style>
