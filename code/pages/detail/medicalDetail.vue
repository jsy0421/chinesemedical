<template>
	<view class="container">
		<view class="tui-medical-title">{{name}}</view>
		<view v-for="(item,index) in medicalList" :key="index" class="detail" :id="'main-'+index">
			<view v-if="index%2 == 0">
				<view class="tui-chatbox tui-chatbox-left">
					{{item.medicalTitle}}
				</view>
			</view>
			<view v-else>
				<view class='tui-flex tui-align-right'>
					<view class="tui-chatbox tui-chatbox-right tui-top40">
						{{item.medicalTitle}}
					</view>
				</view>
			</view>
			<text class="tui-article">{{item.medicalDetail}}</text>
			<view v-if="index%3 == 1">
				<image :src="banner[getRandom()]" class="tui-article-pic" mode="widthFix"></image>
			</view>
		</view>

		<Share></Share>

	</view>
</template>

<script>
	import Show from '../../component/index/Show.vue'
	import tuiTag from '../../component/thorui/tui-tag/tui-tag'
	import Share from '../../component/index/share.vue';
	export default {
		components: {
			Show,
			tuiTag,
			Share
		},
		mounted() {
			this.fetchmedicalDetailData();

		},
		created() {
			this.fetchmedicalDetailImgData();
		},
		data() {
			return {
				banner: [],
				name: '',
				medicalList: []
			}
		},
		onLoad: function(option) {
			if (option.id != undefined) {
				this.name = option.id;
			}
			this.fetchmedicalDetailImgData();
		},
		methods: {
			fetchmedicalDetailData: function() {
				var _this = this;
				uni.request({
					url: 'http://192.168.43.90:3333/medicaldetail',
					data: {
						medicalName: _this.name
					},
					method: 'GET',
					success: (res) => {
						_this.medicalList = res.data
					},
					fail: (err) => {
						console.log(err);
					}
				})
			},
			fetchmedicalDetailImgData: function() {
				var _this = this;
				uni.request({
					url: 'http://192.168.43.90:3333/medicaldetailImg',
					data: {
						medicalName: _this.name
					},
					method: 'GET',
					success: (res) => {
						for (var i = 0; i < res.data.length; i++) {
							_this.banner[i] = res.data[i].medicalImg
						}
					},
					fail: (err) => {
						console.log(err);
					}
				})
			},
			getRandom: function() {
				var number = Math.floor(Math.random() * this.banner.length);
				return number;
			},
		},
		onPullDownRefresh: function() {
			// 下拉刷新
			console.log('refresh');
			setTimeout(function() {
				uni.stopPullDownRefresh();
			}, 1000);
		},
	}
</script>

<style>
	page {
		background: #fff;
		color: #333;
	}

	.container {
		padding: 40rpx 30rpx 110rpx 30rpx;
		box-sizing: border-box;
	}

	.detail {
		padding-top: 30px;
		border-bottom: #BFBFBF dashed 0.5px;
	}

	.tui-medical-title {
		font-size: 48rpx;
		font-weight: 500;
		text-align: center;
		letter-spacing: 5px;
	}

	/*聊天框*/
	.tui-chatbox {
		border-radius: 10rpx;
		position: relative;
		padding: 20rpx 26rpx;
		margin: 10px;
		font-size: 32rpx;

	}

	.tui-chatbox-left {
		background: #FFFFFF;
		border: 1rpx solid #5c8dff;
		display: inline-block;
		float: left;
		color: #5c8dff;
	}

	.tui-chatbox-right {
		background: #FFFFFF;
		border: 1rpx solid #19be6b;
		display: block;
		float: right;
		color: #19be6b;
	}

	.tui-chatbox::before {
		content: "";
		position: absolute;
		width: 0;
		height: 0;
		top: 20rpx;
		border: 16rpx solid;
	}

	.tui-chatbox-left::before {
		right: 100%;
		border-color: transparent #5c8dff transparent transparent;
	}

	.tui-chatbox-right::before {
		left: 100%;
		border-color: transparent transparent transparent #19be6b;
	}

	.tui-article {
		/* text-indent: 2em; */
		font-size: 34rpx;
		padding-bottom: 40rpx;
		line-height: 60rpx;
		text-align: justify;
		word-break: break-all;
		word-wrap: break-word;
		display: block;
	}

	.tui-article-pic {
		width: 100%;
		display: block;
		margin-bottom: 40rpx;
	}
</style>
