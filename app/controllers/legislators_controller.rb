class LegislatorsController < ApplicationController

  def index
    @legislators = Legislator.search(params[:search])
      if request.xhr?
         render :layout => false
      end
  end

  def show
    gun_laws = [
      "Firearms and explosives",
      "Arms control and nonproliferation"
      ]

    immigration = [
      "Civil Rights and Liberties, Minority Issues",
      "Department of Homeland Security",
      "Border security and unlawful immigration",
      "Foreign labor",
      "Homeland Security",
      "Immigration status and procedures",
      "Refugees, asylum, displaced persons",
      "Visas and passports",
      "Immigrant health and welfare",
      "Customs enforcement",
      "Citizenship and naturalization",
      "Immigration"
      ]

    lgbtq = [
      "Sex, gender, sexual orientation discrimination",
      "Hate crimes"
      ]

    economy = [
      "Business records",
      "Small business",
      "Income tax credits",
      "Employee benefits and pensions",
      "Consumer affairs",
      "Wages and earnings",
      "Business investment and capital",
      "Corporate finance and management",
      "Banking and financial institutions regulation",
      "Bank accounts, deposits, capital",
      "Inflation and prices",
      "Commodities markets",
      "Finance and Financial Sector",
      "Budget deficits and national debt",
      "Employee hiring",
      "Economic performance and conditions",
      "Office of Management and Budget (OMB)",
      "Taxation",
      "Tax-exempt organizations",
      "Sales and excise taxes",
      "Department of commerce",
      "Department of Treasury",
      "Federal Reserve System",
      "Performance measurement",
      "Internal Revenue Service (IRS)",
      "Tax administration and collection, taxpayers",
      "Transfer and inheritance taxes",
      "Housing finance and home ownership",
      "Public-private cooperation",
      "Government lending and loan guarantees",
      "Currency",
      "Housing and community development funding",
      "Manufacturing",
      "Competitiveness, trade promotion, trade deficits",
      "Trade agreements and negotiations",
      "Interest, dividends, interest rates",
      "Accounting and auditing",
      "Credit and credit markets",
      "Debt collection",
      "Economics and Public Finance",
      "State and local finance",
      "Income tax exclusion",
      "Trade restrictions",
      "Employee performance",
      "Office of the U.S. Trade Representative",
      "International monetary system and foreign exchange",
      "Foreign trade and international finance",
      "Free trade and trade barriers",
      "Labor standards",
      "Tariffs",
      "Small Business Administration",
      "State and local taxation",
      "Tax reform and tax simplification",
      "Labor-management relations",
      "Foreign and international banking",
      "Minority and disadvantaged businesses",
      "Economic development",
      "Department of the Interior",
      "Bankruptcy",
      "Commodity Futures Trading Commission",
      "Congressional Budget Office (CBO)",
      "Equal Employment Opportunity Commission (EEOC)",
      "Federal Deposit Insurance Corporation (FDIC)",
      "Federal Labor Relations Authority",
      "Federal Trade Commission (FTC)",
      "Foreign loans and debt",
      "Government Accountability Office (GAO)",
      "Government National Mortgage Association (Ginnie Mae)",
      "Government Publishing Office (GPO)",
      "Income tax deferral",
      "Office of Personnel Management (OPM)",
      "Property tax",
      "Tax treatment of families",
      "Taxation of foreign income",
      "Trade and Development Agency",
      "Trade secrets and economic espionage",
      "U.S. and foreign investments",
      "Unemployment",
      "Women in business",
      "Consumer Financial Protection Bureau",
      "Employment discrimination and employee rights",
      "Income tax deductions",
      "Employment and training programs",
      "Economic Theory",
      "Retail and wholesale trades",
      "Consumer Financial Protection Bureau",
      "Business expenses",
      "Financial literacy",
      "Foreign Trade and International Finance",
      "Women's employment",
      "Social Security Administration",
      "Senate Committee on the Budget",
      "Minority employment",
      "Employee leave",
      "Commerce",
      "Monetary policy",
      "Self-emloyed",
      "Employment taxes"
      ]


    healthcare = [
      "Abortion",
      "health programs administration and funding",
      "Health care costs and insurance",
      "Comprehensive health care",
      "Health care coverage and access",
      "Health facilities and institutions",
      "Prescription drugs",
      "Mental health",
      "Drug therapy",
      "Health personnel",
      "Health promotion and preventive care",
      "Neurological disorders",
      "Allied health services",
      "Drug, alcohol, tobacco use",
      "Medicare",
      "Health information and medical records",
      "Women's health",
      "Veterans's medical care",
      "Medical tests and diagnostic methods",
      "Infectious and parastic diseases",
      "Health technology, devices, supplies",
      "Emergency medical services and trauma care",
      "Medicaid",
      "General health and health care finance matters",
      "Health",
      "Department of Health and Human Services",
      "Medical research",
      "Teenage pregnancy",
      "Hospital care",
      "Minority health",
      "Sex and reproductive health",
      "Long-term, rehabilitative, and terminal care",
      "Digestive and metabolic diseases",
      "Surgery and anesthesia",
      "Health care quality",
      "Family planning and birth control",
      "Alternative treatments",
      "Musculoskeletal and skin diseases",
      "HIV/AIDS",
      "World Health",
      "National Institutes of Health (NIH)",
      "Medical ethics",
      "Nursing",
      "Centers for Disease Control and Prevention (CDC)",
      "Immunology and vaccination",
      "Drug safety, medical device, and laboratory regulation",
      "Organ and tissue donation and transplantation"
      ]


    # @legislator = Legislator.find_by(first_name: params[first_name], last_name: params[last_name])
    @legislator = Legislator.find_by(last_name: "Sanders")
    @issues_percents = []

    issues = [gun_laws, immigration, lgbtq, economy, healthcare]
    idx = 0
    issues.each do |issue|
      categories = ["gun laws", "immigration", "lgbtq", "economy", "healthcare"]
      @issues_percents << (@legislator.issue_positions(issue)).merge!(name: categories[idx])
      idx += 1
    end

  end

end
