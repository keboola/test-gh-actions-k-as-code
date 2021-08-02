--GoogleAds campaigns source data
CREATE TABLE "bdm_marketing_campaign_costs"
AS
    SELECT
        "Day" || '-' || 'GoogleAds' || '-' || "Campaign" "MARKETING_CAMPAIGN_COSTS_ID"
      , 'GoogleAds'                                      "SOURCE"
      , "Day"                                            "DATE"
      , "Campaign"                                       "CAMPAIGN"
      , SUM("Impressions")                               "IMPRESSIONS"
      , SUM("Clicks")                                    "CLICKS"
      , SUM("Cost") / 1000000                            "COST"
    FROM "CAMPAIGN_PERFORMANCE_REPORT"
    GROUP BY 1, 2, 3, 4;

--GoogleAds campaigns source data grouped by month
CREATE TABLE "bdm_marketing_campaign_costs_monthly"
AS
    SELECT
        LEFT("Day", 7) || '-01-' || 'GoogleAds' || '-' || "Campaign" "MARKETING_CAMPAIGN_COSTS_ID"
      , 'GoogleAds'                                                  "SOURCE"
      , LEFT("Day", 7) || '-01'                                      "DATE"
      , "Campaign"                                                   "CAMPAIGN"
      , SUM("Impressions")                                           "IMPRESSIONS"
      , SUM("Clicks")                                                "CLICKS"
      , SUM("Cost") / 1000000                                        "COST"
    FROM "CAMPAIGN_PERFORMANCE_REPORT"
    GROUP BY 1, 2, 3, 4;
