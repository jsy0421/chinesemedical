<template>
	<view class="container">
		<view class="tui-news-title">{{newsDetailList.title}}</view>
		<view class="tui-sub-info">
			<view class="tui-sub-left">
				<text class="tui-author">{{newsDetailList.name}}</text>
				<text>{{newsDetailList.time}}</text>
			</view>
			<view class="tui-sub-right">阅读 {{newsDetailList.readNum}}</view>
		</view>
		<view class="tui-news-content">
			<view class="tui-article">{{newsarticleList[0]}}</view>
			<view class="tui-article">
				{{newsarticleList[1]}}
			</view>
			<image :src="newsimgList[0]" class="tui-article-pic" mode="widthFix"></image>
			<view class="tui-article">{{newsarticleList[2]}}。</view>
			<view class="tui-article">
				{{newsarticleList[3]}}
			</view>
			<image :src="newsimgList[1]" class="tui-article-pic" mode="widthFix"></image>
			<view class="tui-article">
				{{newsarticleList[4]}}
			</view>
		</view>

		<view class="tui-news-source">消息参考来源：{{newsDetailList.source}}</view>

		<view class="tui-operate-box">
			<tui-tag padding="26rpx 56rpx" :type="isFabulous ? 'primary' : 'gray'" shape="circle" :plain="true"
				@click="btnFabulous">
				<tui-icon :name="iconName(isFabulous)" :size="20" :color="iconColor"></tui-icon>
				<text class="tui-black" :class="[isFabulous ? 'tui-primary' : '']">{{ fabulous }}赞</text>
			</tui-tag>
			<button open-type="share" class="tui-share-btn">
				<tui-tag padding="26rpx 60rpx" type="gray" shape="circle" :plain="true">
					<tui-icon name="partake" :size="20" color="#333"></tui-icon>
					<text class="tui-black">分享</text>
				</tui-tag>
			</button>
		</view>

		<view class="tui-cmt-title">精彩评论（{{cmtList.length}}）</view>

		<simpleReply :cmtList="cmtList" :replyDetail="replyDetail"></simpleReply>

		<template>
			<Share></Share>
		</template>

		<!--加载loadding-->
		<tui-nomore backgroundColor="#fff" text="没有更多评论"></tui-nomore>
	</view>
</template>

<script>
	import tuiTag from '../../component/thorui/tui-tag/tui-tag.vue';
	import tuiIcon from '../../component/thorui/tui-icon/tui-icon.vue';
	import tuiListCell from '../../component/thorui/tui-list-cell/tui-list-cell.vue';
	import tuiBadge from '../../component/thorui/tui-badge/tui-badge.vue';
	import tuiNomore from '../../component/thorui/tui-nomore/tui-nomore.vue';
	import Share from '../../component/index/share.vue';
	import simpleReply from '../../component/index/simpleReply.vue';

	export default {
		components: {
			tuiTag,
			tuiIcon,
			tuiListCell,
			tuiBadge,
			tuiNomore,
			Share,
			simpleReply
		},
		mounted() {
			this.fetchNewsDetailData();
			this.fetchNewsArticalData();
			this.fetchNewsImgData();
			this.fetchNewsReplyData();
			this.fetchReplyDetailData();
		},
		data() {
			return {
				cmtList: [],
				replyDetail: [],
				fabulous: 0,
				isFabulous: false,
				newsDetailList: [],
				newsarticleList: [],
				newsimgList: [],
				pageIndex: 1,
			}
		},
		computed: {
			iconColor() {
				return this.isFabulous ? '#5677fc' : '#333'
			},
			
			iconName() {
				return function(isFabulous) {
					return isFabulous ? 'agree-fill' : 'agree'
				}
			}
		},
		methods: {
			btnFabulous: function() {
				this.fabulous = this.isFabulous ? 123 : 124;
				this.isFabulous = !this.isFabulous
			},
			
			btnCmt: function() {
				uni.navigateTo({
					url: '../comment/comment'
				})
			},			
			fetchNewsDetailData: function() {
				var _this = this;
				uni.request({
					url: 'http://192.168.43.90:3333/newsdetail',
					data: {},
					method: 'GET',
					success: (res) => {
						_this.newsDetailList = res.data[0];
						_this.fabulous = res.data[0].fabulous;
					},
					fail: (err) => {
						console.log(err);
					}
				})
			},
			fetchNewsArticalData: function() {
				// console.log(_this.newsarticleId)
				var _this = this;
				uni.request({
					url: 'http://192.168.43.90:3333/newsarticle',
					data: {},
					method: 'GET',
					success: (res) => {
						var array = res.data;
						for (var i = 0; i < array.length - 1; i++) {
							_this.newsarticleList.push(array.slice(i, i + 1)[0].article);
						}
						_this.newsarticleList.push(res.data[array.length - 1].article);
					},
					fail: (err) => {
						console.log(err);
					}
				})
			},
			fetchNewsImgData: function() {
				var _this = this;
				uni.request({
					url: 'http://192.168.43.90:3333/newsImg',
					data: {},
					method: 'GET',
					success: (res) => {
						var array = res.data;
						for (var i = 0; i < array.length - 1; i++) {
							_this.newsimgList.push(array.slice(i, i + 1)[0].newsImg);
						}
						_this.newsimgList.push(res.data[array.length - 1].newsImg);
					},
					fail: (err) => {
						console.log(err);
					}
				})
			},
			fetchNewsReplyData: function() {
				var _this = this;
				uni.request({
					url: 'http://192.168.43.90:3333/newsreply',
					data: {},
					method: 'GET',
					success: (res) => {
						_this.cmtList = res.data;
					},
					fail: (err) => {
						console.log(err);
					}
				})
			},
			fetchReplyDetailData: function() {
				var _this = this;
				uni.request({
					url: 'http://192.168.43.90:3333/replydetail',
					data: {},
					method: 'GET',
					success: (res) => {
						_this.replyDetail = res.data;
					},
					fail: (err) => {
						console.log(err);
					}
				})
			},
			onPullDownRefresh: function() {
				// 下拉刷新
				console.log('refresh');
				setTimeout(function() {
					uni.stopPullDownRefresh();
				}, 1000);
			},
		}
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

	.tui-news-title {
		font-size: 48rpx;
		font-weight: 500;
		text-align: justify;
	}

	.tui-sub-info {
		padding-top: 30rpx;
		display: flex;
		align-items: center;
		justify-content: space-between;
		font-size: 28rpx;
		color: #999;
	}

	.tui-sub-left {
		margin-top: -30px;
	}

	.tui-author {
		color: #5677fc;
		padding-right: 20rpx;
	}

	.tui-news-content {
		padding-top: 40rpx;
	}

	.tui-article {
		font-size: 34rpx;
		padding-bottom: 40rpx;
		line-height: 60rpx;
		text-align: justify;
		word-break: break-all;
		word-wrap: break-word;
	}

	.tui-article-pic {
		width: 100%;
		display: block;
		margin-bottom: 40rpx;
	}

	.tui-news-source {
		font-size: 24rpx;
		color: #999;
	}

	.tui-operate-box {
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 60rpx 40rpx;
		box-sizing: border-box;
	}

	.tui-black {
		color: #333;
		padding-left: 12rpx;
	}

	.tui-cmt-title {
		font-size: 30rpx;
		font-weight: bold;
		position: relative;
	}

	.tui-cmt-title::after {
		content: '';
		position: absolute;
		left: -18rpx;
		top: 18%;
		width: 6rpx;
		height: 64%;
		background: #5677fc;
	}



	.tui-primary {
		color: #5677fc !important;
	}



	.tui-share-btn {
		display: block;
		background: none;
		margin: 0;
		padding: 0;
	}

	.tui-share-btn::after {
		border: 0px;
	}
</style>
