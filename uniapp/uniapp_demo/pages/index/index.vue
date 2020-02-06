<template>
	<view class="content">
		<image class="logo" src="/static/logo.png"></image>
		<view class="text-area">
			<text id="title" class="title">{{title}}</text>
			<br>   
			<button v-on:click="test_funcion">测试按钮</button>
		</view>
	</view>
</template>

<script>
	export default {
		//uniapp的写法和vue原版稍有不同(基本一样),一个组件被合并进了一个vue文件了,
		//el选取器也不需要了,uniqpp里面直接给每个组件/对象写 属性和方法 即可
		
		//属性
		data() {
			return {
				title: 'test',
			}
		},
		
		//方法
		methods: {
			
			test_funcion: function () {
				this.title = this.title + "->";
			},
			
		},
		
		// 页面加载时的执行逻辑
		onLoad() {
			uni.showModal({
				title: "test"
			})
		},
		
	}
</script>

<style>
	.content {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	.logo {
		height: 200rpx;
		width: 200rpx;
		margin-top: 200rpx;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 50rpx;
	}

	.text-area {
		display: flex;
		justify-content: center;
	}

	.title {
		font-size: 36rpx;
		color: #8f8f94;
	}
</style>
