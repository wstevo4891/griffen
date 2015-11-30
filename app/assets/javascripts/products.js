var $v6dcs = $('.v610').attr('data-click-state', 0);

var $v5dcs = $('.v510').attr('data-click-state', 0);

var $v6Move = function() {
	if( $v6dcs != 1 ) {
		$v6dcs = 1;
		$('.v510').hide('slow');
		$('.p610').show('slow');
		$('.v610').animate({ left: '+=5em' }, 'slow');
	} else if( $v6dcs == 1 ) {
		$v6dcs = 0;
		$('.p610').hide('slow');
		$('.v510').show('slow');
		$('.v610').animate({ left: '-=5em' }, 'slow');
	}
};

var $v5Move = function() {
	if( $v5dcs != 1 ) {
		$v5dcs = 1;
		$('.v610').hide('slow');
		$('.p510').show('slow');
		$('.v510').animate({ left: '-=5em' }, 'slow');
	} else if( $v5dcs == 1 ) {
		$v5dcs = 0;
		$('.p510').hide('slow');
		$('.v610').show('slow');
		$('.v510').animate({ left: '+=5em' }, 'slow');
	}
};

var $mobile_v6Move = function() {
	if( $v6dcs != 1 ) {
		$v6dcs = 1;
		$('.p610').show('slow');
	} else if( $v6dcs == 1 ) {
		$v6dcs = 0;
		$('.p610').hide('slow');
	}
};

var $mobile_v5Move = function() {
	if( $v5dcs != 1 ) {
		$v5dcs = 1;
		$('.p510').show('slow');
	} else if( $v5dcs == 1 ) {
		$v5dcs = 0;
		$('.p510').hide('slow');
	}
};

var main = function() {
	if( $('.demo-2').css('display') == 'inline-block' ) {
		$('.v610').on('click', function() {
			$v6Move();
		});
		$('.v510').on('click', function() {
			$v5Move();
		});
	} else if($('.demo-2').css('display') == 'block') {
		$('.v610').on('click', function() {
			$mobile_v6Move();
		});
		$('.v510').on('click', function() {
			$mobile_v5Move();
		});
	}	
};

$(document).ready(main);
