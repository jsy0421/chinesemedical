<template>
	<view class="container">
		<view class="tui-cmt-primary">
			<view class="tui-cmt-cell tui-cell-last">
				<view class="tui-header-box">
					<view class="tui-userinfo-box">
						<image :src="newsreply.avatar" class="tui-avatar"></image>
						<view class="tui-nickname-box">
							<view class="tui-cmt-nickname">{{ newsreply.nickname}}</view>
							<view class="tui-cmt-time">{{newsreply.time}}</view>
						</view>
					</view>
					<view class="tui-fabulous" :class="{ 'tui-primary': isFabulous }" @tap="btnFabulous">
						<text>{{ fabulous == 0 ? '赞' : fabulous }}</text>
						<tui-icon :name="isFabulous ? 'agree-fill' : 'agree'" :size="15"
							:color="isFabulous ? '#5677fc' : '#9a9a9a'"></tui-icon>
					</view>
				</view>
				<view class="tui-cmt-content">{{newsreply.content}}</view>
			</view>
		</view>
		<view class="tui-empty"></view>
		<view class="tui-cmt-title">全部回复（{{replyList.length}}）</view>
		
		<allReply :replyList="replyList"></allReply>

		<reply></reply>

		<tui-nomore backgroundColor="#fff" text="没有更多回复"></tui-nomore>
	</view>
</template>

<script>
	import tuiIcon from '../../component/thorui/tui-icon/tui-icon.vue';
	import tuiListCell from '../../component/thorui/tui-list-cell/tui-list-cell.vue';
	import tuiNomore from '../../component/thorui/tui-nomore/tui-nomore.vue';
	import reply from '../../component/index/reply.vue'
	import allReply from '../../component/index/allReply.vue'
	export default {
		components: {
			tuiIcon,
			tuiListCell,
			tuiNomore,
			reply,
			allReply
		},
		mounted() {
			this.fetchReplyDetailData();
			this.fetchNewsReplyData();
		},
		data() {
			return {
				replyList: [],
				fabulous: 0,
				isFabulous: false,
				newsreply: []
			};
		},
		methods: {
			btnFabulous: function() {
				this.fabulous = this.isFabulous ? this.fabulous-1 : this.fabulous+1;
				this.isFabulous = !this.isFabulous;
			},
			
			fetchNewsReplyData: function() {
				var _this = this;
				uni.request({
					url: 'http://192.168.43.90:3333/newsreply',
					data: {},
					method: 'GET',
					success: (res) => {
						_this.newsreply = res.data[0];
						_this.fabulous = res.data[0].fabulous;
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
						_this.replyList = res.data;
						console.log(res.data);
					},
					fail: (err) => {
						console.log(err);
					}
				})
			}
		},
		//页面相关事件处理函数--监听用户下拉动作
		onPullDownRefresh: function() {
			setTimeout(() => {
				uni.stopPullDownRefresh();
			}, 1000);
		}
	};
</script>

<style>
	@import "../../component/css/reply.css";
	page {
		background-color: #fff;
		color: #333;
	}

	.container {
		padding-bottom: 110rpx;
		box-sizing: border-box;
	}

	.tui-empty {
		width: 100%;
		height: 10rpx;
		background-color: #eaeef1;
	}

	.tui-cell-last::after {
		border-bottom: 0 !important;
	}
	
	.tui-cmt-title {
		font-size: 30rpx;
		font-weight: bold;
		position: relative;
		padding: 20rpx 30rpx;
		box-sizing: border-box;
		margin-bottom: 20rpx;
	}

	.tui-cmt-title::after {
		content: '';
		position: absolute;
		left: 12rpx;
		top: 30%;
		width: 6rpx;
		height: 40%;
		background: #5677fc;
	}

	.tui-primary {
		color: #5677fc;
	}
</style>
