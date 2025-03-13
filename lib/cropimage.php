<?php
error_reporting(0);
function cropimage($w, $h, $src, $watermark = false) {
    global $_SERVER, $_GET, $CONFIG, $dir_path, $cache_image_path;
    
	$watermark = false;
	
    $w = $w * 1.2;
    $h = $h * 1.2;

    $w1 = $w;
    $h1 = $h;

    $savepath = $_SERVER['DOCUMENT_ROOT'] . $cache_image_path;
    $src = urldecode($src);
    $src = str_replace("//", "/", $src);
    $image = '' . preg_replace('/^(s?f|ht)tps?:\/\/[^\/]+/i', '', (string) $src);
    $image1 = $image;
    $image = $_SERVER['DOCUMENT_ROOT'] . $image;
    $new_name = basename($image);
    $directory_name = str_replace('/', '-', dirname($src)) . '_';
    $ext = pathinfo($image, PATHINFO_EXTENSION);
    $new_name = substr($new_name, 0, -strlen($ext) - 1);
    $new_name = $directory_name . $new_name . "_cr_" . $w . "x" . $h . "." . $ext;
    //$new_name = $directory_name . $new_name . "_cr_" . $w . "x" . $h . ".png";
    if (file_exists($_SERVER['DOCUMENT_ROOT'] . $cache_image_path . $new_name)) {
        return $new_name;
    } else {
        if (file_exists($image) && $image1 && $ext) {
            try {
                $size = getimagesize($image);
                $img = WideImage::load($image);

                if ($size[0] <= $w1 && $size[1] <= $h1) {
                    $im = $img->resizeUp($w, $h, 'outside');
                } else {
                    if ($size[0] > $size[1] && $size[0] > $w) {
                        $im = $img->resize($w, $h, 'outside');
                    } elseif ($size[0] <= $size[1] && $size[1] > $h) {
                        $im = $img->resize($w, $h, 'outside');
                    } else {
                        $im = $img;
                    }
                }
                $img1 = $im->crop('center', 'center', $w, $h);
				
				if ($watermark == true) {
                    if (file_exists($_SERVER['DOCUMENT_ROOT'] . $CONFIG['watermark_image'])) {
                        $waterm = WideImage::load($_SERVER['DOCUMENT_ROOT'] . $CONFIG['watermark_image']);
                        $img1 = $img1->merge($waterm, 5, 5, 100);
                    }
                }				
				
				
				if( $ext == 'png')
                	$original = WideImage::load("./lib/imgcrop1.png");
				else
					$original = WideImage::load("./lib/imgcrop.png");
					
                $original = $original->crop('center', 'center', $w1, $h1);
				
			
				if ($ext == "png")
					$original->merge($img1, 'center', 'center', 100)->saveToFile($savepath.$new_name,9, PNG_NO_FILTER);
				else
					$original->merge($img1, 'center', 'center', 100)->saveToFile($savepath.$new_name,90);
                
                
                $original->destroy();
                //$img1= $im->crop('center', 'center', $w, $h)->saveToFile($savepath.$new_name);;
                //$img1->output('jpg', 100);
                return $new_name;
            } catch (Exception $e) {
                
            }
        }
    }
}
function resizeimage($w, $h, $src, $watermark = false) {
    global $_SERVER, $_GET, $CONFIG, $dir_path, $cache_image_path;
	
	$watermark = false;
	
    $w = $w*1.2;
    $h = $h*1.2;
    
    $savepath = $_SERVER['DOCUMENT_ROOT'] . $cache_image_path;
    $src = urldecode($src);
    $src = str_replace("//", "/", $src);
    $image = '' . preg_replace('/^(s?f|ht)tps?:\/\/[^\/]+/i', '', (string) $src);
    $image1 = $image;
    $image = $_SERVER['DOCUMENT_ROOT'] . $image;
    $new_name = basename($image);
    $directory_name = str_replace('/', '-', dirname($src)) . '_';
    $ext = pathinfo($image, PATHINFO_EXTENSION);
    $new_name = substr($new_name, 0, -strlen($ext) - 1);
    $new_name = $directory_name . $new_name . "_rs_" . $w . "x" . $h . "." . $ext;
    //$new_name = $directory_name . $new_name . "_thumb_" . $w . "x" . $h . ".png";
    if (file_exists($_SERVER['DOCUMENT_ROOT'] . $cache_image_path . $new_name)) {
        return $new_name;
    } else {
        if (file_exists($image) && $image1 && $ext) {
            try {
                $img = WideImage::load($image);
                $wh = getimagesize($image);
                $xRatio = $w / $wh[0];
                $yRatio = $h / $wh[1];
                if ($wh[0] < $w && $wh[1] < $h) {
                    $w = $w;
                    $h = $h;
                } else if ($xRatio * $wh[1] < $h) {
                    $tnHeight = ceil($xRatio * $wh[1]);
                    $tnWidth = $w;
                } else {
                    $tnWidth = ceil($yRatio * $wh[0]);
                    $tnHeight = $h;
                }
                $w = $tnWidth;
                $h = $tnHeight;
				
                if ($watermark == true) {
                    if (file_exists($_SERVER['DOCUMENT_ROOT'] . $CONFIG['watermark_image'])) {

                        $waterm = WideImage::load($_SERVER['DOCUMENT_ROOT'] . $CONFIG['watermark_image']);
                        $img = $img->merge($waterm, 5, 5, 100);
                    }
                }
				
				if ($ext == "png")
					$im = $img->resize($w, $h, 'outside')->saveToFile($savepath.$new_name,9, PNG_NO_FILTER);
				else
					$im = $img->resize($w, $h, 'outside')->saveToFile($savepath.$new_name,90);
				
                
                //$im->saveToFile($savepath.$new_name, 100);
                return $new_name;
            } catch (Exception $e) {
                
            }
        }
    }
}


function resizeimage1($w, $h, $src, $watermark = false) {
    global $_SERVER, $_GET, $CONFIG, $dir_path, $cache_image_path;
    //require( "lib/imagelib/WideImage.php" );
    
	$watermark = false;
	
    $w = $w*1.2;
    $h = $h*1.2;    
    
    $w1 = $w;
    $h1 = $h;

    $savepath = $_SERVER['DOCUMENT_ROOT'] . $cache_image_path;
    $src = urldecode($src);
    $src = str_replace("//", "/", $src);
    $image = '' . preg_replace('/^(s?f|ht)tps?:\/\/[^\/]+/i', '', (string) $src);
    $image1 = $image;
    $image = $_SERVER['DOCUMENT_ROOT'] . $image;
    $new_name = basename($image);
    $directory_name = str_replace('/', '-', dirname($src)) . '_';
    $ext = pathinfo($image, PATHINFO_EXTENSION);
    $new_name = substr($new_name, 0, -strlen($ext) - 1);
    $new_name = substr($directory_name, 1, strlen($directory_name)) . $new_name . "_rs1_" . $w . "x" . $h . "." . $ext;
    if (file_exists($_SERVER['DOCUMENT_ROOT'] . $cache_image_path . $new_name)) {
        return $new_name;
    } else {
        if (file_exists($image) && $image1 && $ext) {
            try {
                $img = WideImage::load($image);
                $wh = getimagesize($image);
                $xRatio = $w / $wh[0];
                $yRatio = $h / $wh[1];
                if ($wh[0] < $w && $wh[1] < $h) {
                    $w = $w;
                    $h = $h;
                } else if ($xRatio * $wh[1] < $h) {
                    $tnHeight = ceil($xRatio * $wh[1]);
                    $tnWidth = $w;
                } else {
                    $tnWidth = ceil($yRatio * $wh[0]);
                    $tnHeight = $h;
                }
                $w = $tnWidth;
                $h = $tnHeight;
                if ($ext == 'png')
                    $original = WideImage::load("./lib/imgcrop1.png");
                else
                    $original = WideImage::load("./lib/imgcrop.png");

                $original = $original->crop('center', 'center', $w1, $h1); //->getTransparentColor();
				
				if ($watermark == true) {
                    if (file_exists($_SERVER['DOCUMENT_ROOT'] . $CONFIG['watermark_image'])) {
                        $waterm = WideImage::load($_SERVER['DOCUMENT_ROOT'] . $CONFIG['watermark_image']);
                        $original = $original->merge($waterm, 5, 5, 100);
                    }
                }				

                if ($wh[0] <= $w1 && $wh[1] <= $h1) {
                    $im = $img;
                } else {
                    $im = $img->resize($w, $h, 'outside');
                }
                
												
				
				
				if ($ext == "png")
					$original->merge($im, 'center', 'center', 100)->saveToFile($savepath . $new_name,9, PNG_NO_FILTER);
				else
					$original->merge($im, 'center', 'center', 100)->saveToFile($savepath . $new_name,90);
				
				
				
                //$im = $im->merge($original)->saveToFile($savepath.$new_name);
                //$im->saveToFile($savepath.$new_name, 100);
                return $new_name;
            } catch (Exception $e) {
                
            }
        }
    }
}


function resizeimagepng($w, $h, $src, $watermark = false) {
    global $_SERVER, $_GET, $CONFIG, $dir_path, $cache_image_path;
    //require( "lib/imagelib/WideImage.php" );
    $w1 = $w;
    $h1 = $h;
    $watermark = false;
    $savepath = $_SERVER['DOCUMENT_ROOT'] . $cache_image_path;
    $src = urldecode($src);
    $src = str_replace("//", "/", $src);
    $image = '' . preg_replace('/^(s?f|ht)tps?:\/\/[^\/]+/i', '', (string) $src);
    $image1 = $image;
    $image = $_SERVER['DOCUMENT_ROOT'] . $image;
    $new_name = basename($image);
    $directory_name = str_replace('/', '-', dirname($src)) . '_';
    $ext = pathinfo($image, PATHINFO_EXTENSION);
    $new_name = substr($new_name, 0, -strlen($ext) - 1);
    $new_name = substr($directory_name, 1, strlen($directory_name)) . $new_name . "_thumbcr_" . $w . "x" . $h . ".png";
    if (file_exists($_SERVER['DOCUMENT_ROOT'] . $cache_image_path . $new_name)) {
        return $new_name;
    } else {
        if (file_exists($image) && $image1 && $ext) {
            try {
                $img = WideImage::load($image);
                $wh = getimagesize($image);
                $xRatio = $w / $wh[0];
                $yRatio = $h / $wh[1];
                if ($wh[0] < $w && $wh[1] < $h) {
                    $w = $w;
                    $h = $h;
                } else if ($xRatio * $wh[1] < $h) {
                    $tnHeight = ceil($xRatio * $wh[1]);
                    $tnWidth = $w;
                } else {
                    $tnWidth = ceil($yRatio * $wh[0]);
                    $tnHeight = $h;
                }
                $w = $tnWidth;
                $h = $tnHeight;
                $original = WideImage::load("./lib/cropimagepng.png");
                $original = $original->crop('center', 'center', $w1, $h1); //->getTransparentColor();
                if ($watermark == true) {
                    if (file_exists($_SERVER['DOCUMENT_ROOT'] . $CONFIG['watermark_image'])) {
                        //echo $CONFIG['watermark_image'];
                        $waterm = WideImage::load($_SERVER['DOCUMENT_ROOT'] . $CONFIG['watermark_image']);
                        $img = $img->merge($waterm, 'center', 'center', 100);
                    }
                }
                if ($wh[0] <= $w1 && $wh[1] <= $h1) {
                    $im = $img;
                } else {
                    $im = $img->resize($w, $h, 'outside');
                }
                //$img1= $im->crop('center', 'center', $w, $h);
                $original->merge($im, 'center', 'center', 100)->saveToFile($savepath . $new_name);
                //$im = $im->merge($original)->saveToFile($savepath.$new_name);
                //$im->saveToFile($savepath.$new_name, 100);
                return $new_name;
            } catch (Exception $e) {
                
            }
        }
    }
}
function roundimage($w, $h, $src, $round) {
    global $_SERVER, $_GET, $CONFIG, $dir_path, $cache_image_path;
    $savepath = $_SERVER['DOCUMENT_ROOT'] . $cache_image_path;
    $src = urldecode($src);
    $src = str_replace("//", "/", $src);
    $image = '' . preg_replace('/^(s?f|ht)tps?:\/\/[^\/]+/i', '', (string) $src);
    $image1 = $image;
    $image = $_SERVER['DOCUMENT_ROOT'] . $image;
    $new_name = basename($image);
    $directory_name = str_replace('/', '-', dirname($src)) . '_';
    $ext = pathinfo($image, PATHINFO_EXTENSION);
    $new_name = substr($new_name, 0, -strlen($ext) - 1);
    $new_name = $directory_name . $new_name . "_cr_" . $w . "x" . $h . "." . $ext;
    if (file_exists($_SERVER['DOCUMENT_ROOT'] . $cache_image_path . $new_name)) {
        return $new_name;
    } else {
        if (file_exists($image) && $image1 && $ext) {
            try {
                $size = getimagesize($image);
                $img = WideImage::load($image);
                if ($size[0] > $size[1] && $size[0] > $w) {
                    $im = $img->resize($w, $h, 'outside');
                } elseif ($size[0] <= $size[1] && $size[1] > $h) {
                    $im = $img->resize($w, $h, 'outside');
                } else {
                    $im = $img;
                }
                $original = WideImage::load("./images/icon-logo-image.png");
                $color = '#';
                $img1 = $im->crop('center', 'center', $w, $h)->merge($original);
                $img1 = $img1->roundCorners(25, null)->saveToFile($savepath . $new_name);
                //$img1->output('jpg', 100);
                return $new_name;
            } catch (Exception $e) {
                
            }
        }
    }
}
function execute($image, $radius, $color, $smoothness, $corners) {
    if ($smoothness < 1) {
        $sample_ratio = 1;
    } elseif ($smoothness > 16) {
        $sample_ratio = 16;
    } else {
        $sample_ratio = $smoothness;
    }
    $corner = WideImage::createTrueColorImage($radius * $sample_ratio, $radius * $sample_ratio);
    if ($color === null) {
        imagepalettecopy($corner->getHandle(), $image->getHandle());
        $bg_color = $corner->allocateColor(0, 0, 0);
        $corner->fill(0, 0, $bg_color);
        $fg_color = $corner->allocateColor(255, 255, 255);
        $corner->getCanvas()->filledEllipse($radius * $sample_ratio, $radius * $sample_ratio, $radius * 2 * $sample_ratio, $radius * 2 * $sample_ratio, $fg_color);
        $corner = $corner->resize($radius, $radius);
        $result = $image->asTrueColor();
        $tc = $result->getTransparentColor();
        if ($tc == -1) {
            $tc = $result->allocateColorAlpha(255, 255, 255, 127);
            imagecolortransparent($result->getHandle(), $tc);
            $result->setTransparentColor($tc);
        }
        if ($corners & WideImage::SIDE_TOP_LEFT || $corners & WideImage::SIDE_LEFT || $corners & WideImage::SIDE_TOP) {
            $result = $result->applyMask($corner, -1, -1);
        }
        $corner = $corner->rotate(90);
        if ($corners & WideImage::SIDE_TOP_RIGHT || $corners & WideImage::SIDE_TOP || $corners & WideImage::SIDE_RIGHT) {
            $result = $result->applyMask($corner, $result->getWidth() - $corner->getWidth() + 1, -1, 100);
        }
        $corner = $corner->rotate(90);
        if ($corners & WideImage::SIDE_BOTTOM_RIGHT || $corners & WideImage::SIDE_RIGHT || $corners & WideImage::SIDE_BOTTOM) {
            $result = $result->applyMask($corner, $result->getWidth() - $corner->getWidth() + 1, $result->getHeight() - $corner->getHeight() + 1, 100);
        }
        $corner = $corner->rotate(90);
        if ($corners & WideImage::SIDE_BOTTOM_LEFT || $corners & WideImage::SIDE_LEFT || $corners & WideImage::SIDE_BOTTOM) {
            $result = $result->applyMask($corner, -1, $result->getHeight() - $corner->getHeight() + 1, 100);
        }
        return $result;
    } else {
        $bg_color = $color;
        $corner->fill(0, 0, $bg_color);
        $fg_color = $corner->allocateColorAlpha(127, 127, 127, 127);
        $corner->getCanvas()->filledEllipse($radius * $sample_ratio, $radius * $sample_ratio, $radius * 2 * $sample_ratio, $radius * 2 * $sample_ratio, $fg_color);
        $corner = $corner->resize($radius, $radius);
        $result = $image->copy();
        if ($corners & WideImage::SIDE_TOP_LEFT || $corners & WideImage::SIDE_LEFT || $corners & WideImage::SIDE_TOP) {
            $result = $result->merge($corner, -1, -1, 100);
        }
        $corner = $corner->rotate(90);
        if ($corners & WideImage::SIDE_TOP_RIGHT || $corners & WideImage::SIDE_TOP || $corners & WideImage::SIDE_RIGHT) {
            $result = $result->merge($corner, $result->getWidth() - $corner->getWidth() + 1, -1, 100);
        }
        $corner = $corner->rotate(90);
        if ($corners & WideImage::SIDE_BOTTOM_RIGHT || $corners & WideImage::SIDE_RIGHT || $corners & WideImage::SIDE_BOTTOM) {
            $result = $result->merge($corner, $result->getWidth() - $corner->getWidth() + 1, $result->getHeight() - $corner->getHeight() + 1, 100);
        }
        $corner = $corner->rotate(90);
        if ($corners & WideImage::SIDE_BOTTOM_LEFT || $corners & WideImage::SIDE_LEFT || $corners & WideImage::SIDE_BOTTOM) {
            $result = $result->merge($corner, -1, $result->getHeight() - $corner->getHeight() + 1, 100);
        }
        return $result;
    }
}
?>