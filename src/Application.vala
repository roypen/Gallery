/*
* Copyright (c) 2011-2018 Your Organization (https://yourwebsite.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Lukasz Piekarski <roypen@outlook.com>
*/


public class GalleryApp : Gtk.Application {

	public GalleryApp () {
		Object (
			application_id: "com.github.roypen.Gallery",
			flags: ApplicationFlags.FLAGS_NONE
		);
	}

	protected override void activate () {

		var main_window = new Gtk.ApplicationWindow (this);
		main_window.default_width = 800;
		main_window.default_height = 600;
		main_window.title = "Simple Image Gallery";
		
		var layout = new Gtk.Grid ();
		layout.column_spacing = 10;
		layout.row_spacing = 10;

		var image = new Gtk.Image.from_file ("images/image_1.jpg");
		
		var left_button = new Gtk.Button.with_label ("<-");
		var right_button = new Gtk.Button.with_label ("->");

		layout.attach (image, 1, 0, 2, 1);
		layout.attach (left_button, 1, 1, 1, 1);
		layout.attach (right_button, 2, 1, 1, 1);

		left_button.clicked.connect (() => {
			image.file = "images/image_2.jpg";
			left_button.sensitive = true;
		});

		right_button.clicked.connect (() => {
			image.file = "images/image_1.jpg";
			right_button.sensitive = true;
		});

		main_window.add (layout);




		main_window.show_all ();

	}

	public static int main (string[] args) {
		var app = new GalleryApp ();
		return app.run (args);
	}

}




