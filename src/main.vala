using GLib;
using Gtk;
using WebKit;
using Posix;

public class Browser : Window {
	private string file_destination = GLib.Environment.get_user_cache_dir () + "/youtube-music/cookies/";
	private string cookies_location = GLib.Environment.get_user_cache_dir () + "/youtube-music/cookies/cookie.txt";
	private const string URL = "http://music.youtube.com/";
	private const string TITLE = "Browser";
	private string[] whitelist = {
		"http://music.youtube.com/"
	};
	private string[] blacklist = {
		"https://hello.world"
	};

	private void ensure_cookies_exist () {
		Posix.mkdir (GLib.Environment.get_user_cache_dir () + "/youtube-music", 0700);
		Posix.mkdir (this.file_destination, 0700);
		File.new_for_path (this.cookies_location);
	}

	public Browser () {
		this.ensure_cookies_exist ();
		this.window_position = WindowPosition.CENTER;
		this.set_default_size (800, 600);
		this.destroy.connect(Gtk.main_quit);

		Gtk.HeaderBar headerbar = new Gtk.HeaderBar ();
		headerbar.show_close_button = true;
		headerbar.title = Browser.TITLE;
		headerbar.subtitle = "yeee boiii";
		this.set_titlebar (headerbar);

		WebKit.Settings settings = new WebKit.Settings ();
		settings.enable_developer_extras = true;
		settings.enable_webaudio = true;
		WebKit.WebView view = new WebKit.WebView ();
		WebKit.CookieManager cookie_manager = view.get_context ().get_cookie_manager ();
		cookie_manager.set_persistent_storage (this.cookies_location, WebKit.CookiePersistentStorage.SQLITE);
		WebKit.UserContentManager user_content_manager = new WebKit.UserContentManager ();
		WebKit.UserScript script = new WebKit.UserScript (
			"window.alert(1);",
			UserContentInjectedFrames.ALL_FRAMES,
			UserScriptInjectionTime.END,
			whitelist,
			blacklist
		);
		user_content_manager.add_script (script);
		WebKit.WebView new_view = new view.with_user_content_manager (user_content_manager);
		new_view.set_settings (settings);
		new_view.load_uri (Browser.URL);
		//  new_view.settings.enable_developer_extras = true;

		ScrolledWindow scrolled_window = new ScrolledWindow(null, null);
		scrolled_window.set_policy(PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
		scrolled_window.add(new_view);

		this.add(scrolled_window);
	}

	public static int main(string[] args) {
		Gtk.init(ref args);

		Browser browser = new Browser();
		browser.show_all();

		Gtk.main();

		return 0;
	}
}