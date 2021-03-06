<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>


<!doctype html>
<html>
<head>
<style>
.setting-entry
{
	height: 28px;
	font-size: 18px;
	text-shadow: 2px 2px 3px rgba(0, 0, 0, 1);
	padding-top: 14px;
	display:block;
	color:#CCCCCC;
	text-decoration: none;
	max-width:100%;
	margin-left:30px;
}
.setting-entry-checkbox
{
	cursor: pointer;
}

.setting-entry-slider
{
}

.setting-entry-slider input
{
	width: 50%;
}



input[type='range']
{
	display:block;
}

input[type='checkbox']
{
	width:20px;
	height:20px;
}

</style>
</head>
<body>
	<div class='settings-page'>
		<h2>Sound/Music</h2>
		<div class='setting-entry setting-entry-checkbox'><input type='checkbox' id='checkboxDisableMusic'> Disable music</div>
		<div class='setting-entry setting-entry-checkbox'><input type='checkbox' id='checkboxDisableEnvironmentSoundEffects'> Disable environment sound effects</div>
		<div class='setting-entry setting-entry-slider'>Music Volume
			<input type="range" id='sliderMusicVolume'>
		</div>
		<div class='setting-entry setting-entry-slider'>Sound Effects Volume
			<input type="range" id='sliderSoundEffectsVolume'>
		</div>
		
		<h2>Bandwidth</h2>
		<div class='setting-entry setting-entry-checkbox'><input type='checkbox' id='checkboxDisableBanners'> Disable all banners</div>
		<div class='setting-entry setting-entry-checkbox'><input type='checkbox' id='checkboxDisableOnlyAnimatedBanners'> Disable only animated banners</div>
		<div class='setting-entry setting-entry-checkbox'><input type='checkbox' id='checkboxDisableAds'> Disable ads</div>
		
		<h2>Performance</h2>
		<div class='setting-entry setting-entry-checkbox'><input type='checkbox' id='checkboxDisableWeather'> Disable weather effects</div>
		<div class='setting-entry setting-entry-checkbox'><input type='checkbox' id='checkboxDisableTravelAnimations'> Disable travel animations</div>
		<div class='setting-entry setting-entry-checkbox'><input type='checkbox' id='checkboxUseLowResolutionMap'> Use low resolution map</div>
		
		<h2>Nitpicky Buggers</h2>
		<div class='setting-entry setting-entry-slider'>Max screen width (for desktop)
			<input type="range" id='sliderMaxScreenWidth' min='400' max='1280'>
		</div>
		
	</div>
	
	<center><p><a onclick='fullpageRefresh()' style='font-size:24px'>Apply Changes</a></p></center>
	
	<script type="text/javascript">
		var checkboxIds = ["checkboxDisableMusic", 
		                   "checkboxDisableEnvironmentSoundEffects", 
		                   "checkboxDisableBanners",
		                   "checkboxDisableOnlyAnimatedBanners", 
		                   "checkboxDisableWeather", 
		                   "checkboxDisableTravelAnimations",
		                   "checkboxDisableAds",
		                   "checkboxUseLowResolutionMap"];
		for(var i = 0; i<checkboxIds.length; i++)
		{
			var checkboxId = checkboxIds[i];
			var currentSetting = localStorage.getItem(checkboxId);
			
			if (currentSetting=="true")
				$("#"+checkboxId).prop("checked", "true");
		}

		var rangeIds = ["sliderMusicVolume", 
		                "sliderSoundEffectsVolume",
		                "sliderMaxScreenWidth"];
		var rangeDefaults = [100, 
		                     100, 
		                     1280];
		for(var i = 0; i<rangeIds.length; i++)
		{
			var rangeId = rangeIds[i];
			var currentSetting = localStorage.getItem(rangeId);
			if (currentSetting==null)
				currentSetting = ""+rangeDefaults[i];
			$("#"+rangeId).prop("value", currentSetting);
		}
		
		
		$(".setting-entry-checkbox input").change(function() 
		{
			localStorage.setItem(this.id+"", this.checked);    
		});				
		
		$(".setting-entry-slider input").change(function(){
			localStorage.setItem(this.id+"", this.value);
		});
		
		$("#checkboxDisableMusic").change(function(){
			toggleMusic(this.checked);
		});
		$("#checkboxDisableEnvironmentSoundEffects").change(function(){
			toggleEnvironmentSoundEffects(this.checked);
		});
		/*
		$("#checkboxDisableBanners").change(function(){
			toggleBanners(this.checked);
		});
		$("#checkboxDisableOnlyAnimatedBanners").change(function(){
			toggleOnlyAnimatedBanners(this.checked);
		});
		$("#checkboxDisableWeather").change(function(){
			toggleWeather(this.checked);
		});
		$("#checkboxDisableTravelAnimations").change(function(){
			toggleTravelAnimations(this.checked);
		});
		*/
		$("#sliderSoundEffectsVolume").change(function(){
			updateEnvironmentSoundEffectsVolume();
		});
		$("#sliderMaxScreenWidth").change(function(){
			modifyMaxScreenWidth();
		});

	</script>
</body>
</html>
