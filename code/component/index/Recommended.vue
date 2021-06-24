<template>
	<scroll-view class="floor-list" scroll-x>
		<view class="scoll-wrapper">
			<view v-for="(item, index) in goodsList" :key="index" class="floor-item"
				@click="navToDetailPage(item.page,item.name)">
				<image :src="item.image" mode="aspectFill"></image>
				<text class="name">{{item.name}}</text>
				<text class="detail">{{item.detail}}</text>
			</view>
		</view>
	</scroll-view>
</template>

<script>
	export default {
		name: 'seckill',
		props: {
			goodsList: {
				type: Array,
			}
		},
		methods: {
			navToDetailPage(url, name) {
				uni.navigateTo({
					url: url + "?id=" + name
				})
			}

		}
	}
</script>

<style scoped lang="scss">

	.floor-list {
		white-space: nowrap;
	}

	.scoll-wrapper {
		display: flex;
		align-items: flex-start;
	}

	.floor-item {
		display: flex;
		flex-direction: column;
		width: 150upx;
		margin-right: 20upx;
		font-size: $uni-font-size-sm + 2rpx;
		color: $font-color-dark;
		line-height: 1.8;
		align-items: center;

		image {
			width: 150upx;
			height: 150upx;
			border-radius: 6upx;
		}

		.name {
			padding-top: $uni-spacing-col-sm;
			color: $uni-color-title;
			font-size: $uni-font-size-lg;
			letter-spacing: 5upx;
		}

		.detail {
			color: $uni-text-color-placeholder;
			font-size: $uni-font-size-sm;
			opacity: $uni-opacity-disabled;
		}
	}
</style>
