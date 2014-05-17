module DomainHtml

  # Domain links: '/', 'company/careers', '/pricing'
  # Subdomains: 'cloud.digitalocean.com/...'
  # External links: 'techcrunch/...'
  # Assets: /assets/images/techcrunch.png, /assets/images/cover_create.jpg, //use.typekit.net/wix0mlm.js, /assets/css/style.css
  def root_html
    '<!doctype html>
    <html data-placeholder-focus="false">
      <head>
        <meta charset="utf-8">
        <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
        <title>SSD Cloud Server, VPS Server, Simple Cloud Hosting | DigitalOcean</title>
        <meta name="description" content="Deploy an 512MB RAM and 20GB SSD cloud server in 55 seconds for $5/month. Simple, fast, scalable SSD cloud virtual servers.">
        <meta name="keywords" content="cloud server, cloud hosting, vps, vps server, vps server hosting, vps hosting, virtual server, virtual private server, ubuntu server, centos server, debian server, linux server, fedora server, linux mint server">
        <meta name="viewport" content="width=1200, maximum-scale=1" />
        <link href="/assets/css/style.css" media="screen" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="//use.typekit.net/wix0mlm.js"></script>
        <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
      </head>
      <body class="index">
        <header>
          <div class="wrapper-full">
            <a class="logo" href="/">DigitalOcean</a>
            <a id="hiring" href="/company/careers/">We\'re Hiring!</a>
            <nav id="button-nav">
              <ul>
                <li><a href="https://cloud.digitalocean.com/login">Log In</a></li>
                <li class="button-outline"><a href="https://cloud.digitalocean.com/registrations/new">Sign Up</a></li>
              </ul>
            </nav>
            <nav>
              <ul>
                <li><a class="" href="/pricing/">Pricing</a></li>
              </ul>
            </nav>
          </div>
        </header>
        <section class="main">
          <section id="homepage-features" class="homepage-section">
            <div class="wrapper-full">
              <h2>A control panel experience made simple.</h2>
              <div id="browser">
                <div id="last-vid">
                  <a href="#" class="restart standard-button">Replay</a>
                </div>
                <p class="url">https://cloud.digitalocean.com/droplets</p>
                <video height="100%" class="feature-video" preload="none" poster="/assets/images/cover_create.jpg">
                  <source src="/assets/video/create.mp4" type="video/mp4">
                  <source src="/assets/video/create.webm" type="video/webm">
                  Your browser does not support the video tag.
                </video>
              </div>
              <ul id="feature-controls">
                <li class="create active" data-video-url="/assets/video/create.webm" data-url-bar="https://cloud.digitalocean.com/droplets">
                  <a href="#">
                    <div class="icon">
                      <span></span>
                    </div>
                    <h3>Create Droplets</h3>
                    <p>Setup and deploy your Droplet\'s configuration in a matter of seconds. </p>
                  </a>
                </li>
              </ul>
            </div>
          </section>
          <section id="companies-using">
            <div class="wrapper-full">
              <h3>As Seen On</h3>
              <ul>
                <li><a href="http://techcrunch.com/article/"><img src="/assets/images/techcrunch.png"></a></li>
              </ul>
            </div>
          </section>
          <section class="call-to-action">
            <div class="wrapper-full">
               <h2>Deploy an SSD cloud server in 55 seconds.</h2>
               <p>Sign up for DigitalOcean today.</p>
               <a class="standard-button" href="https://cloud.digitalocean.com/registrations/new">
                 GET STARTED NOW <span></span>
               </a>
            </div>
          </section>
        </section>
      </body>
    </html>'
  end

  # Domain links: '/', 'company/careers', '/features'
  # Subdomains: 'cloud.digitalocean.com/...'
  # External links: 'mashable/...'
  # Assets: /assets/css/style.css, /assets/images/mashable.png
  def pricing_html
    '<!doctype html>
    <html data-placeholder-focus="false">
      <head>
        <meta charset="utf-8">
        <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
        <title>Pricing</title>
        <meta name="description" content="Deploy an 512MB RAM and 20GB SSD cloud server in 55 seconds for $5/month. Simple, fast, scalable SSD cloud virtual servers.">
        <meta name="keywords" content="cloud server, cloud hosting, vps, vps server, vps server hosting, vps hosting, virtual server, virtual private server, ubuntu server, centos server, debian server, linux server, fedora server, linux mint server">
        <meta name="viewport" content="width=1200, maximum-scale=1" />
        <link href="/assets/css/style.css" media="screen" rel="stylesheet" type="text/css" />
        <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
      </head>
      <body class="index">
        <header>
          <div class="wrapper-full">
            <a class="logo" href="/">DigitalOcean</a>
            <a id="hiring" href="/company/careers/">We\'re Hiring!</a>
            <nav id="button-nav">
              <ul>
                <li><a href="https://cloud.digitalocean.com/login">Log In</a></li>
                <li class="button-outline"><a href="https://cloud.digitalocean.com/registrations/new">Sign Up</a></li>
              </ul>
            </nav>
            <nav>
              <ul>
                <li><a class="" href="/features/">Features</a></li>
                <li><a id="hiring" href="/company/careers/">We\'re Hiring!</a></li>
              </ul>
            </nav>
          </div>
        </header>
        <section class="main">
          <section id="homepage-features" class="homepage-section">
            <div class="wrapper-full">
              <h2>A control panel experience made simple.</h2>
              <div id="browser">
                <div id="last-vid">
                  <a href="#" class="restart standard-button">Replay</a>
                </div>
                <p class="url">https://cloud.digitalocean.com/droplets</p>
              </div>
              <ul id="feature-controls">
                <li class="dns" data-video-url="/assets/video/dns.webm" data-url-bar="https://cloud.digitalocean.com/domains">
                  <a href="#">
                    <div class="icon">
                      <span></span>
                    </div>
                    <h3>DNS Management</h3>
                    <p>Full feature DNS management allows<br>you to easily manage your domains.</p>
                  </a>
                </li>
              </ul>
            </div>
          </section>
          <section id="companies-using">
            <div class="wrapper-full">
              <h3>As Seen On</h3>
              <ul>
                <li><a href="http://mashable.com/article/"><img src="/assets/images/mashable.png"></a></li>
              </ul>
            </div>
          </section>
          <section class="call-to-action">
            <div class="wrapper-full">
               <h2>Deploy an SSD cloud server in 55 seconds.</h2>
               <p>Sign up for DigitalOcean today.</p>
               <a class="standard-button" href="https://cloud.digitalocean.com/registrations/new">
                 GET STARTED NOW <span></span>
               </a>
            </div>
          </section>
        </section>
      </body>
    </html>'
  end

  # Domain links: '/', 'company/careers', '/pricing'
  # Subdomains: 'cloud.digitalocean.com/...'
  # External links: 'venturebeat/...'
  # Assets: /assets/images/venturebeat.png
  def features_html
    '<!doctype html>
    <html data-placeholder-focus="false">
      <head>
        <meta charset="utf-8">
        <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
        <title>Features</title>
        <meta name="description" content="Deploy an 512MB RAM and 20GB SSD cloud server in 55 seconds for $5/month. Simple, fast, scalable SSD cloud virtual servers.">
        <meta name="keywords" content="cloud server, cloud hosting, vps, vps server, vps server hosting, vps hosting, virtual server, virtual private server, ubuntu server, centos server, debian server, linux server, fedora server, linux mint server">
        <meta name="viewport" content="width=1200, maximum-scale=1" />
        <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
      </head>
      <body class="index">
        <header>
          <div class="wrapper-full">
            <a class="logo" href="/">DigitalOcean</a>
            <a id="hiring" href="/company/careers/">We\'re Hiring!</a>
            <nav id="button-nav">
              <ul>
                <li><a href="https://cloud.digitalocean.com/login">Log In</a></li>
                <li class="button-outline"><a href="https://cloud.digitalocean.com/registrations/new">Sign Up</a></li>
              </ul>
            </nav>
            <nav>
              <ul>
                <li><a class="" href="/pricing/">Pricing</a></li>
              </ul>
            </nav>
          </div>
        </header>
        <section class="main">
          <section id="homepage-features" class="homepage-section">
            <div class="wrapper-full">
              <h2>A control panel experience made simple.</h2>
              <div id="browser">
                <div id="last-vid">
                  <a href="#" class="restart standard-button">Replay</a>
                </div>
              </div>
              <ul id="feature-controls">
                <li class="backups" data-video-url="/assets/video/snapshot.webm" data-url-bar="https://cloud.digitalocean.com/images">
                  <a href="#">
                    <div class="icon">
                      <span></span>
                    </div>
                    <h3>Snapshots</h3>
                    <p>Build a new server from a snapshot<br>you took, saving you configuration time.</p>
                  </a>
                </li>
              </ul>
            </div>
          </section>
          <section id="companies-using">
            <div class="wrapper-full">
              <h3>As Seen On</h3>
              <ul>
                <li><a href="http://venturebeat.com/article/"><img src="/assets/images/venturebeat.png"></a></li>
              </ul>
            </div>
          </section>
          <section class="call-to-action">
            <div class="wrapper-full">
               <h2>Deploy an SSD cloud server in 55 seconds.</h2>
               <p>Sign up for DigitalOcean today.</p>
               <a class="standard-button" href="https://cloud.digitalocean.com/registrations/new">
                 GET STARTED NOW <span></span>
               </a>
            </div>
          </section>
        </section>
      </body>
    </html>'
  end

  def careers_html
    '<!doctype html>
    <html data-placeholder-focus="false">
      <body>
        No substantial content
      </body>
    </html>'
  end
end
