<template>
	<view class="tui-cmtbox">
		<view class="tui-cmt-cell" v-for="(item, index) in cmtList" :key="index">
			<view class="tui-cmt-detail">
				<view class="tui-header-box">
					<view class="tui-userinfo-box">
						<image :src="item.avatar" class="tui-avatar"></image>
						<view class="tui-nickname-box">
							<view class="tui-cmt-nickname">{{ item.nickname }}</view>
						</view>
					</view>
					<view class="tui-fabulous" :class="[item.isFabulous ? 'tui-primary' : '']" :id="index"
						@tap="cmtFabulous">
						<text>{{ item.fabulous == 0 ? '赞' : item.fabulous }}</text>
						<tui-icon :name="iconName(item.isFabulous)" :size="15" :color="itemIconColor(item.isFabulous)">
						</tui-icon>
					</view>
				</view>
				<view class="tui-cmt-content">{{ item.content }}</view>
				<view class="tui-reply-box" v-if="item.replayNum > 0">
					<tui-list-cell backgroundColor="#f2f2f2" :size="28" v-for="(items, index2) in replyDetail"
						:key="index2" :unlined="item.replayNum < 2 && replyDetail.length - 1 == index" @tap="cmtReply">
						<view class="tui-flex-1 tui-reply-nickname">{{ items.nickname }}</view>
						<view class="tui-flex-1">{{ items.content | ellipsis }}</view>
					</tui-list-cell>
					<tui-list-cell padding="20rpx 30rpx" backgroundColor="#f2f2f2" :size="28" :unlined="true"
						v-if="item.replayNum > 2" @tap="cmtReply">
						<view class="tui-flex-1  tui-cell-last">
							<text>共{{ item.replayNum }}条回复</text>
							<tui-icon name="arrowright" :size="22" color="#5677fc"></tui-icon>
						</view>
					</tui-list-cell>
				</view>
				<view class="tui-footer">
					{{ item.time }}
					<view class="tui-primary tui-ml" hover-class="opcity" :hover-start-time="150" @tap="cmtReply">回复
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import tuiIcon from '../../component/thorui/tui-icon/tui-icon.vue';
	import tuiListCell from '../../component/thorui/tui-list-cell/tui-list-cell.vue';
	export default {
		components: {
			tuiListCell,
			tuiIcon
		},
		props: {
			cmtList: {
				type: Array
			},
			replyDetail: {
				type: Array
			}
		},
		methods: {
			itemIconColor: function(isFabulous) {
				return isFabulous ? '#5677fc' : '#9a9a9a'
			},
			iconName: function(isFabulous) {
				return isFabulous ? 'agree-fill' : 'agree'
			},
			cmtFabulous: function(e) {
				let index = e.currentTarget.id;
				let fabulousObj = this.cmtList[index];
				let isFabulous = this.cmtList[index].isFabulous;
				let fabulous = this.cmtList[index].fabulous;
				let fabulousNum = isFabulous ? fabulous - 1 : fabulous + 1;
				this.$set(fabulousObj, "fabulous", fabulousNum);
				this.$set(fabulousObj, "isFabulous", !isFabulous);
			},
			cmtReply: function() {
				uni.navigateTo({
					url: '../commentReply/commentReply'
				})
			},
		},
		filters: {
			ellipsis: function(value) {
				if (!value) return '';
				if (value.length > 35) {
					return value.slice(0, 35) + '...'
				}
				return value
			}
		}
	}
</script>

<style>
	@import "../../component/css/reply.css";

	.tui-reply-box {
		border-radius: 8rpx;
		overflow: hidden;
		margin-top: 16rpx;
	}

	.tui-cell-last {
		display: flex;
		align-items: center;
		word-wrap: break-word;
		color: #5677fc;
	}

	.tui-flex-1 {
		flex: 1;
		width: 100%;
	}

	.tui-reply-nickname {
		font-size: 24rpx;
		color: #7a7a7a;
		padding-bottom: 8rpx;
	}

	.tui-footer {
		display: flex;
		align-items: center;
		font-size: 24rpx;
		margin-top: 16rpx;
		color: #9a9a9a;
	}

	.tui-ml {
		margin-left: 16rpx;
	}

	.tui-primary {
		color: #5677fc !important;
	}
</style>
