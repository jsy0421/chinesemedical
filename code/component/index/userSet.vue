<template>
	<view class="bottom-container">
		<view class="ul-item">
			<view data-index="2" data-key="二维码" class="item" hover-class="opcity" :hover-stay-time="150">
				<image class="item-img" src="../../static/my/Qrcode.png"></image>
				<text class="item-name">二维码</text>
			</view>
			<view data-index="2" data-key="分享" class="item" hover-class="opcity" :hover-stay-time="150">
				<image class="item-img" src="../../static/my/share.png"></image>
				<text class="item-name">分享</text>
			</view>
			<view data-index="2" data-key="我的评论" class="item" hover-class="opcity" :hover-stay-time="150">
				<image class="item-img" src="../../static/my/comment.png"></image>
				<text class="item-name">我的评论</text>
			</view>
		</view>
		<view class="ul-item">
			<view class="item" hover-class="opcity" :hover-stay-time="150">
				<image class="item-img" src="../../static/my/Setup.png"></image>
				<text class="item-name">设置</text>
			</view>
			<view class="item" hover-class="opcity" :hover-stay-time="150">
				<button open-type="feedback" class="btn-feedback"></button>
				<image class="item-img" src="../../static/my/feedback.png"></image>
				<text class="item-name">反馈</text>
			</view>
			<view data-index="3" class="item" hover-class="opcity" :hover-stay-time="150">
				<image class="item-img" src="../../static/my/about.png"></image>
				<text class="item-name">关于我们</text>
			</view>
		</view>
	</view>
</template>

<script>
</script>

<style>
	.bottom-container {
		height: 334rpx;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		padding: 40rpx 74rpx 40rpx 95rpx;
		margin: 0 30rpx;
		background-color: #ffffff;
		border-radius: 10rpx;
		box-sizing: border-box;
		box-shadow: 0 0 10rpx #efefef;
	}

	.ul-item {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
	}

	.item {
		display: flex;
		flex-direction: column;
		align-items: center;
		position: relative;
	}

	.item-img {
		width: 64rpx;
		height: 64rpx;
	}

	.item-name {
		padding-top: 13rpx;
		font-size: 24rpx;
		color: #666666;
		min-width: 80rpx;
		text-align: center;
	}

	.btn-feedback {
		background: transparent !important;
		position: absolute;
		height: 100%;
		width: 100%;
		left: 0;
		top: 0;
		border: 0;
	}

	.btn-feedback::after {
		border: 0;
	}
</style>
