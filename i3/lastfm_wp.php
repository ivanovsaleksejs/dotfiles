#!/run/current-system/sw/bin/php
<?php
$dir = realpath(dirname($argv[0]));
parse_str($_SERVER['QUERY_STRING'], $_GET);

$apiUrl = "http://ws.audioscrobbler.com/2.0/";
$apiKey = "61d580c50e6e5e3f14b6bd9527e5395f";
$method = "user.gettopalbums";

$user        = $_GET["user"];
$period      = $_GET["period"];
$rows        = $_GET["rows"];
$cols        = $_GET["cols"];
$imagesSize  = $_GET["imageSize"];
$frameWidth  = $_GET["frameWidth"];
$frameHeight = $_GET["frameHeight"];
$noborder    = (bool)(isset($_GET["noborder"]) && $_GET["noborder"]);
// Get 5 more albums incase there isn't an available
// image for one of the requested albums #lazyhackftw
$limit      = ($cols * $rows) + 5;

// create the url
$query = "$apiUrl?method=$method&user=$user&period=$period&limit=$limit&api_key=$apiKey";

// check if the image isn't already loaded
$response     = file_get_contents($query);
$responseHash = md5($response);


$fileName = $dir . "/images/$user.$period.$rows.$cols.$imagesSize.$responseHash";
if (file_exists($fileName)) {
    header("Content-type: image/png");
    echo file_get_contents($fileName);
    exit;
}

// create a DOMDocument which will contain the information returned by Last.fm's Web service
$topAlbums = new DOMDocument();
$topAlbums->load($query);

// get the images' urls
$imagesUrlsList = array();
$topAlbumsList = $topAlbums->getElementsByTagName("album");
for ($i=0; $i<$limit; $i++) {
    if (!preg_match('/default_album/', $topAlbumsList->item($i)->getElementsByTagName("image")->item(3)->nodeValue))
        $imagesUrlsList[] = $topAlbumsList->item($i)->getElementsByTagName("image")->item(3)->nodeValue;
}

// create the images
$images = array();
foreach($imagesUrlsList as $imageUrl){
    $explodedImageUrl = explode(".", $imageUrl);
    $explodedImageUrlSize = sizeof($explodedImageUrl);
    $imageExtension = $explodedImageUrl[$explodedImageUrlSize-1];
    switch ($imageExtension) {
      case 'jpg':
        $images[] = imagecreatefromjpeg($imageUrl);
        break;
      case 'png':
        $images[] = imagecreatefrompng($imageUrl);
        break;
      case 'gif':
        $images[] = imagecreatefromgif($imageUrl);
        break;
    }
}
unset($imageUrl);

// srsbsns: create our albums patchwork \o/
(isset($imagesSize)) ? $imagesSideSize = $imagesSize : $imagesSideSize = 99;
$PatchworkWidth = $frameWidth ? $frameWidth : $imagesSideSize * $cols + ($cols - 1); // 299 is the max size of the Last.fm profile left column ;)
$PatchworkHeight = $frameHeight ? $frameHeight : $imagesSideSize * $rows + ($rows - 1);

$offsetHoriz = intval(($frameWidth - $imagesSideSize * $cols - ($cols - 1))/2);
$offsetVert = intval(($frameHeight - $imagesSideSize * $rows - ($rows - 1))/2);

// create the "empty" patchwork
$patchwork = imagecreatetruecolor($PatchworkWidth, $PatchworkHeight);
// create a black color (reminds me of SDL ^^)
$black = imagecolorallocate($patchwork, 0, 0, 0);
// we fill our patchwork by the white color
imagefilltoborder($patchwork, 0, 0, $black, $black);

// now we "parse" our images in the patchwork, while resizing them :]
for ($i=0; $i<$rows; $i++) {
    for ($j=0; $j<$cols; $j++) {
        imagecopyresampled($patchwork, $images[$cols*$i+$j], $j*$imagesSideSize+$j + $offsetHoriz, $i*$imagesSideSize+$i + $offsetVert, 0, 0, $imagesSideSize+intval($noborder), $imagesSideSize+intval($noborder), imagesx($images[$cols*$i+$j]), imagesy($images[$cols*$i+$j]));
    }
}

// save the image into a file
imagepng($patchwork, $fileName);

// display the image
header("Content-type: image/png");
imagepng($patchwork);

