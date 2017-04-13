class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private 
  def use_common_content
    @show_common_content =true
    @sponsors = Sponsor.all.order("position asc").map{|s| {:name=>s.name, :thumbnail=>s.thumbnail.url, :url=>s.url}}
    @upcoming_deadlines = YAML.load_file(Rails.root.join('app/data/dates.yaml'))['upcoming'].to_a.map{|e| {:name=>e[0], :time=>e[1][0], :link=>e[1][1]}}

    @previous = PreviousConference.all.order("year desc") 

    @channels = [
      {:name=>"Facebook", :size=>:small, :image=>"facebook.png", :description=>"Official Facebook Page", :url=>"https://www.facebook.com/pacificvis/"},
      {:name=>"Twitter", :size=>:small, :image=>"twitter.png", :description=>"Official Twitter Account", :url=>"https://twitter.com/PacificVis"},
      {:name=>"WeChat", :size=>:big, :image=>"wechat_qr.png", :description=>"Official WeChat Account (亚太地区可视化会议微信公众号)".html_safe, :url=>"#"}
    ]
  end

  def get_keynotes
    [
      {
        :day=>2,
        :presenter=>"David Ebert",
        :affiliation=>"Purdue University",
        :thumbnail=>"david_ebert.jpg",
        :title=>"Changing the World with Visual Analytics",
        :abstract=>"To solve the world’s challenges requires not only advancing computer science and big data analytics but requires new analysis and decision-making environments that effectively couple human decision making with advanced, guided analytics in a human-computer collaborative discourse and decision making (HCCD). While many researchers and companies are focusing solely on Big Data Analytics to harness the potential power in available massive, multisource, multivariate, evolving digital data, many of these big data solutions don't effectively factor the human decision maker into their proposed solution. The HCCD approach builds upon visual analytics and focuses on empowering the decision maker through interactive visual analytic environments where visual cognition, guided discovery, and non-digital human expertise and experience can be combined with state-of-the-art analytical techniques.  When we combine this approach with real-world application-driven research, not only does the pace of scientific innovation accelerate, but impactful change occurs. This work and these systems can be applied to social change, advancing engineering, and science and solving some of the world’s greatest challenges such as sustainability and security.  In this talk, I’ll outline this approach and highlight the potential and impact of application driven HCCD research.",
        :bio=>"David Ebert is the Silicon Valley Professor of Electrical and Computer Engineering at Purdue University, a Fellow of the IEEE, and director of the Visual Analytics for Command Control and Interoperability Center (VACCINE), the Visualization Science team of the Department of Homeland Security’s Command Control and Interoperability Center of Excellence. Ebert performs research in visual analytics, volume rendering, illustrative visualization, and procedural abstraction of complex, massive data. He is the recipient of the 2017 IEEE Computer Society vgTC Technical Achievement Award for seminal contributions in visual analytics. He has been very active in the visualization community, serving as Editor in Chief of IEEE Transactions on Visualization and Computer Graphics, serving as IEEE Computer Society Vice President and the IEEE Computer Society’s VP of Publications, and successfully managing a large program of external funding to develop more effective methods for visually communicating information."
      },
      {
        :day=>3,
        :presenter=>"Gerard Jounghyun Kim",
        :affiliation=>"Korea University",
        :thumbnail=>"gerard_kim.jpg",
        :title=>"Requirements and Recent Directions in <br>Augmented Reality Visualization",
        :abstract=>"The field of information visualization studies the interactive visual representations of data to reinforce human cognition, thereby facilitate the discovery of new tacit knowledge and even amplify human intelligence.  Augmented reality (AR) shares the same objective and it can be treated as one particular form of information visualization where the data are both the real objects and the augmentations for them.  As such, it presents a unique set of problems within the general requirements for an effective information visualization method.  In this talk, I will first outline and put forth four main requirements for AR visualization, namely, (1) naturalness, (2) visibility (3) persistance/stability and (4) glass/hmd ergonomics. Then I will present a short survey of the existing AR visualization techniques and characterize them by their attributes and categorize them in terms of how they satisfy or address the proposed requirements. Finally, I will also introduce some of my own on-going research work in this area, specifically, for real time contrast adjustment for mobile augmented reality, usability with glasses, augmentation data organization, and multimodal AR data presentation. I hope that this work can instigate and  shed some light on the future directions for further research in AR visualization techniques.",
        :bio=>"Currently, Professor, Dept. of CSE, Korea University<br>Research Interests: VR/AR/MR, Human Computer Interaction, Computer music<br>BS ECE, Carnegie Mellon University, 87<br>MS/PhD, Univ. of Southern California, 94<br><br>Computer Scientist, National Inst. of Science and Technoglogy (NIST), 94-96<br>Professor, Dept. of CSE, POSTECH,  96-06<br>Visiting Positions at USC, KAIST, Com2us<br><br>2 Books:<br>Designing Virtual Reality Systems: Structured Approach, Springer, 2005<br>Human Computer Interaction: Fundamentals and Practice, CRC Press, 2015<br><br>Has published in Presence, IEEE VR, IEEE TVCG, IEEE ISMAR, ACM VRST, ACM CHI, INTERACT, etc.<br>IEEE ISMAR General Co-chair (2010), ACM VRST Program Chair (2006), etc.<br>Convener of ISO JTC 1 SC 24 WG 9 (Mixed and Augmented Reality Working Group)"
      }
    ]
  end

  def assert_html(layout=nil)
    respond_to do |format|
      if layout.nil?
        format.html
      else
        format.html { render layout: layout }
      end
      
      format.all { render nothing: true, status: 404 }
    end
  end

  def get_committees(filename)
    CSV.parse(File.read("app/data/#{filename}"), :headers=>true).map do |csv_row|
      {:name=>"#{csv_row["first_name"]} #{csv_row["last_name"]}", :affiliation=>csv_row["affiliation"]}
    end
  end

end
