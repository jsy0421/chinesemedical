<template>
	<view class="tui-operation">
		<!--处理部分手机底部兼容-->
		<view class="tui-operation-inner">
			<view class="tui-btn-comment">回复楼主...</view>
		</view>
	</view>
</template>

<script>
</script>

<style>
	.tui-operation {
		width: 100%;
		padding: 0 30rpx;
		box-sizing: border-box;
		overflow: hidden;
		background: rgba(255, 255, 255, 0.95);
		position: fixed;
		left: 0;
		bottom: 0;
		z-index: 99999;
	}
	
	.tui-operation-inner {
		height: 100rpx;
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding-bottom: env(safe-area-inset-bottom);
	}
	
	.tui-operation::before {
		content: '';
		position: absolute;
		top: 0;
		right: 0;
		left: 0;
		border-top: 1rpx solid #eaeef1;
		-webkit-transform: scaleY(0.5);
		transform: scaleY(0.5);
	}
	
	.tui-btn-comment {
		height: 64rpx;
		width: 100%;
		background: #ededed;
		color: #999;
		border-radius: 8rpx;
		font-size: 28rpx;
		display: flex;
		align-items: center;
		padding-left: 20rpx;
		box-sizing: border-box;
		padding-top: 0;
	}
</style>
