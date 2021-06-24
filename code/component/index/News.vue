<template>
	
		<view class="tui-new-box" >
			<view class="tui-new-item" :class="[index!=0 ?'tui-new-mtop':'']" v-for="(item,index) in news"
				:key="index" @click="newsDetail(item.url)">
				<image :src="'/static/index/new.png'" class="tui-new-label"></image>
				<view class="tui-title-box">
					<view class="tui-new-title">{{item.name | ellipsis}}</view>
					<view class="tui-new-detail">{{item.detail | ellipsis}}</view>
				</view>
			</view>
	</view>
</template>

<script>
	export default {
		props: {
			news: {
				type: Array,
			}
		},
		methods: {
			// 跳转详情页
			newsDetail: function(url){
				console.log(url)
				uni.navigateTo({
					url:url
				})
			}
		},
		filters: {
			ellipsis: function(value) {
				if (!value) return '';
				if (value.length > 20) {
					return value.slice(0, 20) + '...'
				}
				return value
			}
		}
	}
</script>

<style scoped lang="less">

	.tui-new-box {
		display: flex;
		align-items: center;
		justify-content: space-between;
		flex-wrap: wrap;
	}

	.tui-new-item {
		width: 100%;
		height: 130rpx;
		padding: 0 20rpx;
		box-sizing: border-box;
		display: flex;
		align-items: center;
		background: #f5f2f9;
		position: relative;
		border-radius: 12rpx;
	}

	.tui-new-mtop {
		margin-top: 2%;
	}

	.tui-new-label {
		width: 56rpx;
		height: 56rpx;
		border-top-left-radius: 12rpx;
		position: absolute;
		left: 0;
		top: 0;
	}

	.tui-title-box {
		font-size: 24rpx;
	}

	.tui-new-title {
		padding-top: 20rpx;
		padding-left: 30rpx;
		font-size: 30rpx;
		font-weight: 500;
		line-height: 32rpx;
		word-break: break-all;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 2;
	}

	.tui-new-detail {
		padding-top: 18rpx;
		font-size: 30rpx;
		color: #a0a0a0;
		transform: scale(0.8);
	}

	.tui-new-img {
		width: 160rpx;
		height: 160rpx;
		display: block;
		flex-shrink: 0;
	}
</style>
