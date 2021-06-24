<template>
	<view class="tui-header-banner">
		<!-- // 轮播图 -->
		<view class="tui-banner-bg">
			<view class="tui-banner-box">
				<swiper :indicator-dots="true" :autoplay="true" :interval="5000" :duration="150"
					class="tui-banner-swiper" :circular="true" indicator-color="rgba(255, 255, 255, 0.8)"
					indicator-active-color="#fff">
					<swiper-item v-for="(item,index) in banner" :key="index">
						<image :src="item" class="tui-slide-image" mode="scaleToFill" />
					</swiper-item>
				</swiper>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		props: {
			banner: {
				type: Array,
			}
		},
	}
</script>

<style>
	@import '../../component/css/show.css'
</style>
