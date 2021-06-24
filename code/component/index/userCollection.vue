<template>
	<view class="middle-container">
		<view data-index="1" class="middle-item" hover-class="opcity" :hover-stay-time="150">
			<image class="ticket-img" src="../../static/my/collection.png"></image>
			<text class="middle-tag">我的收藏</text>
		</view>
		<view class="middle-item" hover-class="opcity" :hover-stay-time="150">
			<image class="car-img" src="../../static/my/history.png"></image>
			<text class="middle-tag">浏览记录</text>
		</view>
	</view>
</template>

<script>
</script>

<style>
	.middle-container {
		height: 138rpx;
		display: flex;
		flex-direction: row;
		align-items: center;
		border-radius: 10rpx;
		background-color: #ffffff;
		margin: -30rpx 30rpx 26rpx 30rpx;
		box-shadow: 0 15rpx 10rpx -15rpx #efefef;
		position: relative;
		z-index: 2;
	}
	.middle-item {
		height: 100%;
		display: flex;
		flex-direction: row;
		align-items: center;
	}
	
	.ticket-img {
		width: 80rpx;
		height: 80rpx;
		margin-left: 65rpx;
	}
	
	.middle-tag {
		font-size: 28rpx;
		color: #333333;
		line-height: 28rpx;
		font-weight: bold;
		padding-left: 22rpx;
	}
	
	.car-img {
		width: 80rpx;
		height: 80rpx;
		margin-left: 97rpx;
	}
</style>
