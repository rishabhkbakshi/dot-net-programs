<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default27.aspx.cs" Inherits="Default27" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>JQuery Photo Slider with Semi Transparent Caption</title>
    <script src="http://code.jquery.com/jquery-1.8.2.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            //Execute the slideShow
            slideShow();
        });
        function slideShow() {
            //Set the opacity of all images to 0
            $('#slideshow a').css({ opacity: 0.0 });
            //Get the first image and display it (set it to full opacity)
            $('#slideshow a:first').css({ opacity: 1.0 });
            //Set the caption background to semi-transparent
            $('#slideshow .caption').css({ opacity: 0.7 });
            //Resize the width of the caption according to the image width
            $('#slideshow .caption').css({ width: $('#slideshow a').find('img').css('width') });
            //Get the caption of the first image from REL attribute and display it
            $('#slideshow .content').html($('#slideshow a:first').find('img').attr('rel'))
        .animate({ opacity: 0.7 }, 400);
            //Call the gallery function to run the slideshow, 6000 = change to next image after 6 seconds
            setInterval('gallery()', 3000);
        }
        function gallery() {
            //if no IMGs have the show class, grab the first image
            var current = ($('#slideshow a.show') ? $('#slideshow a.show') : $('#slideshow a:first'));
            //Get next image, if it reached the end of the slideshow, rotate it back to the first image
            var next = ((current.next().length) ? ((current.next().hasClass('caption')) ? $('#slideshow a:first') : current.next()) : $('#slideshow a:first'));
            //Get next image caption
            var caption = next.find('img').attr('rel');
            //Set the fade in effect for the next image, show class has higher z-index
            next.css({ opacity: 0.0 })
            .addClass('show')
            .animate({ opacity: 1.0 }, 1000);
            //Hide the current image
            current.animate({ opacity: 0.0 }, 1000)
            .removeClass('show');

            //Set the opacity to 0 and height to 1px
            $('#slideshow .caption').animate({ opacity: 0.0 }, { queue: false, duration: 0 }).animate({ height: '1px' }, { queue: true, duration: 300 });
            //Animate the caption, opacity to 0.7 and heigth to 100px, a slide up effect
            $('#slideshow .caption').animate({ opacity: 0.7 }, 100).animate({ height: '100px' }, 500);
            //Display the content
            $('#slideshow .content').html(caption);
        }
    </script>
    <style type="text/css">
        body {
            font-family: arial;
        }

        .clear {
            clear: both;
        }

        #slideshow {
            position: relative;
            height: 360px;
        }

            #slideshow a {
                float: left;
                position: absolute;
            }

                #slideshow a img {
                    border: none;
                }

                #slideshow a.show {
                    z-index: 500;
                }

            #slideshow .caption {
                z-index: 600;
                background-color: #000;
                color: #ffffff;
                height: 100px;
                width: 100%;
                position: absolute;
                bottom: 0;
            }

                #slideshow .caption .content {
                    margin: 5px;
                }

                    #slideshow .caption .content h3 {
                        margin: 0;
                        padding: 0;
                        color: #1DCCEF;
                    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="slideshow">
            <a href="#" class="show">
                <img src="UploadFiles/SP_A2400.jpg" alt="1" height="300" rel="<h3>Slide1 Sample</h3>" />
            </a>
            <a href="#">
                <img src="UploadFiles/SP_A2404.jpg" alt="2" height="300" rel="<h3>Slide2 Example</h3>" />
            </a>
            <a href="#">
                <img src="UploadFiles/SP_A2412.jpg" alt="3" height="300" rel="<h3>Slide3 Example</h3>" />
            </a>
            <div class="caption">
                <div class="content"></div>
            </div>
        </div>
        <div class="clear"></div>
    </form>
</body>
</html>
