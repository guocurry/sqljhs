<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<meta http-equiv="X-UA-Compatible" content="IE=edge"><meta content="text/html; charset=UTF-8" http-equiv="content-type">

<head>
    <title>FAOSTAT</title>
    <link rel='icon' type='image/png' href='//fenixrepo.fao.org/cdn/favicon/faostat.png'>
    <link href='//fenixrepo.fao.org/cdn/fonts/roboto/roboto-main.css' rel='stylesheet' type='text/css'>

    <!-- Download Pivot -->
    <!-- Fancybox -->
    <link type="text/css" rel="stylesheet" href="//fenixrepo.fao.org/cdn/js/jquery.fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
    <link type="text/css" rel="stylesheet" href="//fenixrepo.fao.org/cdn/js/jquery.fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
    <link type="text/css" rel="stylesheet" href="//fenixrepo.fao.org/cdn/js/jquery.fancybox/source/jquery.fancybox.css?v=2.1.4" />
    
    <!-- FAOSTAT-Pivot -->
    <link type="text/css" rel="stylesheet" href="http://faostat3.fao.org//modules/faostat-download-js/pivotAgg/pivot.css" />
    <link type="text/css" rel="stylesheet" href="http://faostat3.fao.org//static/faostat/faostat-pivot.css" />
    <link type="text/css" rel="stylesheet" href="http://faostat3.fao.org//faostat-download-js/pivotAgg/grid/gt_grid_height.css" />

    <link type="text/css" rel="stylesheet" href="//fenixrepo.fao.org/cdn/faostat3/jquery.min.css" />

    <!-- jquery.rangeslider (SEARCH) -->
    <link type="text/css" rel="stylesheet" href="//fenixrepo.fao.org/cdn/js/jquery.rangeslider/5.1.1/css-custom/iThing_custom.css" />

    <!-- chosen -->
    <!-- <link href='//fenixrepo.fao.org/cdn/js/chosen/1.0.0/chosen.min.css' rel='stylesheet'> -->

    <!-- JQWidgets -->
    <link type="text/css" rel="stylesheet" href="//fenixrepo.fao.org/cdn/faostat3/jqwidgets/styles/jqwidgets.min.css"/>

    <!-- Analysis -->
    <!--<link type="text/css" rel="stylesheet" href="/modules/tiled-analysis/css/analysis.css" />-->

    <!-- FAOSTAT CSS -->
    <link type="text/css" rel="stylesheet" href="http://faostat3.fao.org//static/faostat/faostat.css" />
    <link type="text/css" rel="stylesheet" href="http://faostat3.fao.org//static/faostat/faostat-home.css" />
    <link href="//fenixrepo.fao.org/cdn/js/font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<div class="fs-warning-wrapper">
    <div class="fs-warning">
        <div class="standard-title" id="fs-warning-message-title">
            Please Note
        </div>
        <div class="fs-warning-message" id="fs-warning-message"></div>
        <div class="fs-download-hint">
            <ul id="fs-warning-bulk-list">

            </ul>
        </div>
        <div class="fs-warning-btn">
            <a onclick="F3DWLD.continue_with_table();" class="btn btn-big" id="dwl-preview-btn">
                <i class="fa fa-table "></i>
                <div class="btnText" id="buttonSelectAll_usp_GetElementList-text"> CONTINUE WITH TABLE</div>
            </a>
        </div>
        <a id="close-fs-warning" class="fancybox-item fancybox-close" title="Close"></a>
    </div>
</div>

<div class="fs_main_holder">

    <div id="fs-head" class="fs-head">
        <div class="fs-logo-holder">
            <div class="fs-logo"></div>
        </div>
        <div class="fs-united"><p id="fs-fao" style="text-transform:uppercase;"></p>

            <p class="fs-bold fs-statistics-division" style="text-transform:uppercase;"></p></div>
        <div class="fs-languages">
            <span id="langE">ENGLISH</span>|
            <span id="langF">FRAN?AIS</span>|
            <span id="langS">ESPA?OL</span>
        </div>
    </div>

    <div id="fs-menu-header" class="fs-menu-holder">
        <div class="fs-menu">
            <span onclick="CORE.loadModule('home');" id="home"></span>
                    <span id="browse">
                        <div id='menu-dropdown-browse-box' class="menu-dropdown browse-dropdown">
                            <div id='menu-dropdown-browse' class="menu-dropdown-scroller">
                                <ul class="menu-dropdown-list">
                                    <li class="dropdown-element ico-pr" onclick="CORE.loadModule('browse', 'Q/*');"></li>
                                    <li class="dropdown-element ico-tr" onclick="CORE.loadModule('browse', 'T/*');"></li>
                                    <li class="dropdown-element ico-em" onclick="CORE.loadModule('browse', 'G1/*');"></li>
                                    <li class="dropdown-element ico-el" onclick="CORE.loadModule('browse', 'G2/*');"></li>
                                    <li class="dropdown-element ico-fsecurity" onclick="CORE.loadModule('browse', 'D/*');"></li>
                                    <li class="dropdown-element ico-ae" onclick="CORE.loadModule('browse', 'E/*');"></li>
                                    <li class="dropdown-element ico-fb" onclick="CORE.loadModule('browse', 'FB/*');"></li>
                                    <li class="dropdown-element ico-pi" onclick="CORE.loadModule('browse', 'P/*');"></li>
                                    <li class="dropdown-element ico-re" onclick="CORE.loadModule('browse', 'R/*');"></li>
                                    <li class="dropdown-element ico-po" onclick="CORE.loadModule('browse', 'O/*');"></li>
                                    <li class="dropdown-element ico-in" onclick="CORE.loadModule('browse', 'I/*');"></li>
                                    <li class="dropdown-element ico-fo" onclick="CORE.loadModule('browse', 'F/*');"></li>
                                    <li class="dropdown-element ico-asti" onclick="CORE.loadModule('browse', 'AS/AA');"></li>
                                    <li class="dropdown-element ico-emergencyresponse" onclick="CORE.loadModule('browse', 'X/FA');"></li>
                                </ul>
                            </div>
                        </div>
                    </span>
                    <span id="download">
                        <div id='menu-dropdown-download-box' class="menu-dropdown browse-dropdown">
                            <div id='menu-dropdown-download' class="menu-dropdown-scroller">
                                <ul class="menu-dropdown-list">
                                    <li class="dropdown-element ico-pr" onclick="CORE.loadModule('download', 'Q/*');"></li>
                                    <li class="dropdown-element ico-tr" onclick="CORE.loadModule('download', 'T/*');"></li>
                                    <li class="dropdown-element ico-em" onclick="CORE.loadModule('download', 'G1/*');"></li>
                                    <li class="dropdown-element ico-el" onclick="CORE.loadModule('download', 'G2/*');"></li>
                                    <li class="dropdown-element ico-fsecurity" onclick="CORE.loadModule('download', 'D/*');"></li>
                                    <li class="dropdown-element ico-ae" onclick="CORE.loadModule('download', 'E/*');"></li>
                                    <li class="dropdown-element ico-fb" onclick="CORE.loadModule('download', 'FB/*');"></li>
                                    <li class="dropdown-element ico-pi" onclick="CORE.loadModule('download', 'P/*');"></li>
                                    <li class="dropdown-element ico-re" onclick="CORE.loadModule('download', 'R/*');"></li>
                                    <li class="dropdown-element ico-po" onclick="CORE.loadModule('download', 'O/*');"></li>
                                    <li class="dropdown-element ico-in" onclick="CORE.loadModule('download', 'I/*');"></li>
                                    <li class="dropdown-element ico-fo" onclick="CORE.loadModule('download', 'F/*');"></li>
                                    <li class="dropdown-element ico-asti" onclick="CORE.loadModule('download', 'AS/*');"></li>
                                    <li class="dropdown-element ico-emergencyresponse" onclick="CORE.loadModule('download', 'X/*');"></li>
                                </ul>
                            </div>
                        </div>
                    </span>
            <span onclick="CORE.loadModule('compare', null);" id="compare"></span>
            <span onclick="CORE.loadModule('search', '*');" id="search"></span>
            <span onclick="CORE.loadModule('analysis', 'Q/QC');" id="analysis"></span>
            <span onclick="CORE.loadModule('mes', 'methodology_list');" id="mes"></span>
        </div>
        <form style="display:true" id="searchFS" method="get">
            <input type="text" size="40" id="searchFStext">
        </form>
    </div>

    <div class="centralHolder">
        <div id='container'></div>
    </div>

    <div class="fs-footer">

        <div class="fs-row fs-goToBottomPadding">
            <div class="fs_column_12">
                <img src="/static/faostat/images/logo-footer.png" alt="faostat-for a world without hunger" class="fs-logo-footer">
                        <span class="fs-footer-link">
                            <a target="_blank" href="http://www.fao.org/contact-us/terms/en/">&#169; FAO 2015</a>
                            <br>
                            <a id='country_warning' style='cursor: pointer;' onclick='CORE.show_country_alert();'>
                                Country/Territorial Notes
                            </a>
                        </span>
            </div>
        </div>
    </div>

    <div class="fs-feedback">
        <div id="faostat-feedback-system" class="fs-feedback-system-button" class="various myButton"
             data-fancybox-type="iframe" href="//fenixapps.fao.org/feedbacksystem/" target="myFanzy">
            <span id="fs-feedbacksystem-text"></span>
            <div class="fs-feedback-icon"></div>
        </div>
    </div>

    <form style='display: none;' id='excelForm' name='excelForm' method='POST'
          action='http://faostat3.fao.org/wds/rest/table/excel' target='_blank'>
        <div><input type='text' value='faostat' name='cssFilename' id='cssFilename'/></div>
        <div><input type='text' value='' name='datasource' id='datasource'/></div>
        <div><input type='text' value='2' name='decimalNumbers' id='decimalNumbers'/></div>
        <div><input type='text' value='.' name='decimalSeparator' id='decimalSeparator'/></div>
        <div><input type='text' value=',' name='thousandSeparator' id='thousandSeparator'/></div>
        <div><input type='text' value='6' name='valueIndex' id='valueIndex'/></div>
        <div><input type='text' value='' name='json' id='json'/></div>
    </form>

    <form style='display: none;' onsubmit='F3DWLD.onSubmit();' id='excelFormWithQuotes' name='excelFormWithQuotes'
          method='POST' action='http://faostat3.fao.org/wds/rest/exporter/streamexcel' target='_new'>
        <div><input type='text' value='faostat' name='cssFilename_WQ' id='cssFilename_WQ'/></div>
        <div><input type='text' value='' name='datasource_WQ' id='datasource_WQ'/></div>
        <div><input type='text' value='2' name='decimalNumbers_WQ' id='decimalNumbers_WQ'/></div>
        <div><input type='text' value='.' name='decimalSeparator_WQ' id='decimalSeparator_WQ'/></div>
        <div><input type='text' value=',' name='thousandSeparator_WQ' id='thousandSeparator_WQ'/></div>
        <div><input type='text' value='6' name='valueIndex_WQ' id='valueIndex_WQ'/></div>
        <div><input type='text' value='' name='json_WQ' id='json_WQ'/></div>
        <div><input type='text' value='' name='quote_WQ' id='quote_WQ'/></div>
        <div><input type='text' value='' name='title_WQ' id='title_WQ'/></div>
        <div><input type='text' value='' name='subtitle_WQ' id='subtitle_WQ'/></div>
    </form>

    <form style='display: none;'
          onsubmit='F3DWLD.onSubmit();'
          id='csvFormWithQuotes' name='csvFormWithQuotes'
          method='POST'
          action='http://faostat3.fao.org/wds/rest/exporter/streamcsv'
          target='_new'>
        <div><input type='text' value='faostat' name='cssFilename_WQ' id='cssFilename_WQ_csv'/></div>
        <div><input type='text' value='' name='datasource_WQ_csv' id='datasource_WQ_csv'/></div>
        <div><input type='text' value='2' name='decimalNumbers_WQ_csv' id='decimalNumbers_WQ_csv'/></div>
        <div><input type='text' value='.' name='decimalSeparator_WQ_csv' id='decimalSeparator_WQ_csv'/></div>
        <div><input type='text' value=',' name='thousandSeparator_WQ_csv' id='thousandSeparator_WQ_csv'/></div>
        <div><input type='text' value='6' name='valueIndex_WQ_csv' id='valueIndex_WQ_csv'/></div>
        <div><input type='text' value='' name='json_WQ_csv' id='json_WQ_csv'/></div>
        <div><input type='text' value='' name='quote_WQ_csv' id='quote_WQ_csv'/></div>
        <div><input type='text' value='' name='title_WQ_csv' id='title_WQ_csv'/></div>
        <div><input type='text' value='' name='subtitle_WQ_csv' id='subtitle_WQ_csv'/></div>
    </form>

    <form style='display: none;' id='excelForProcedures' name='excelForProcedures' method='POST' action='http://faostat3.fao.org/wds/rest/procedures/excel' target='_new'>
        <div><input type='text' value='payload_excel' name='payload_excel' id='payload_excel'/></div>
    </form>

    <form style='display: none;' id='csvForProcedures' name='csvForProcedures' method='POST' action='http://faostat3.fao.org/wds/rest/procedures/csv' target='_new'>
        <div><input type='text' value='payload_csv' name='payload_csv' id='payload_csv'/></div>
    </form>

    <form style='display: none;' id='growthRateExcelForm' name='growthRateExcelForm' method='POST' action='http://faostat3.fao.org/wds/rest/exporter/excel' target='_blank'>
        <div><input type='text' value='data' name='data' id='data'/></div>
    </form>
    <form id="formExcel" method="post" action="http://faostat3.fao.org/faostat.olap.ws/rest/ExcelCreator">

        <input id="excelData" type="hidden" value="" name="data"/>
        <input type="hidden" value="xls" name="type"/>

    </form>
    <form id="csvDataForm" action="/faostat-download-js/pivotAgg/json.jsp" method="POST">
        <input id="csvData" type="hidden" name="data" value=""/>
    </form>
</div>

<!-- Scripts -->
<script src="//fenixrepo.fao.org/cdn/faostat3/jquery.min.js"></script>
<script src="//fenixrepo.fao.org/cdn/faostat3/jqwidgets/jqwidgets.min.js"></script>
<!-- added missing dependency made with grunt -->
<script src="//fenixrepo.fao.org/cdn/faostat3/jqwidgets/jqxdata.export.js"></script>
<script src="/static/faostat/faostat-gateway-js/faostat-gateway-js.js"></script>
<script src="/static/faostat/faostat-gateway-js/core.js"></script>
<script src="/static/faostat/faostat-gateway-js/UIUtils.js"></script>

<!-- Require-js -->
<script src='//fenixrepo.fao.org/cdn/js/requirejs/2.1.15/require.js'></script>
<script>

/* URLs with repository and static files */
var repository = '//fenixrepo.fao.org/cdn/js/';
var faostat_static = 'static/faostat/';

require.config({

   waitSeconds: 60,

   /* BASE URL of the modules */
   baseUrl: '//faostat3.fao.org/modules',

    paths: {

        'highcharts': repository + 'highcharts/4.0.4/js/highcharts',
        'highcharts_exporting' : repository + 'highcharts/4.0.4/js/modules/exporting',

        // commmons requirejs libraries
        'text': faostat_static + 'common/libs/text',
        'i18n': faostat_static + 'common/libs/i18n',

        // jshashtable
        'jshashtable'       : faostat_static + 'common/libs/jshashtable',

        // Gateway
        'FENIXChartsLibrary' : repository + 'FENIXChartsLibrary/0.4.2/FENIXChartsLibrary',

        // fuzzy search
        'fuse'                  : repository + 'fuse/1.2.2/fuse.min',

        // Home
        'HOME'                               : faostat_static + 'faostat-home-js/faostat-home',
        'HOME_faostat-home-charts'           : faostat_static + 'faostat-home-js/faostat-home-charts',
        'HOME_faostat-home-database-updates' : faostat_static + 'faostat-home-js/database-updates',
	'HOME_faostat-bulk_download' : faostat_static + 'faostat-gateway-js/faostat-ga',

        // Browse
        'BROWSE'                          : 'faostat-browse-js/js/faostat-browse',
        'BROWSE_jshashtable'                :"faostat-browse-js/js/jshashtable",
        'BROWSE_google-analytics-manager'   :"faostat-browse-js/js/google-analytics-manager",
        'BROWSE_faostat-browse-tree'        :"faostat-browse-js/js/faostat-browse-tree",
        'BROWSE_UIBuilder'                  :"faostat-browse-js/js/UIBuilder",
        'BROWSE_UIBuilderGrowthRate'        :"faostat-browse-js/js/UIBuilderGrowthRate",
        'BROWSE_UIBuilderTable'             :"faostat-browse-js/js/UIBuilderTable",
        'BROWSE_UIBuilderMap'               :"faostat-browse-js/js/UIBuilderMap",
        'BROWSE_UIBuilderChart'             :"faostat-browse-js/js/UIBuilderChart",
        'BROWSE_UIBuilderObjectsStructure'  :"faostat-browse-js/js/UIBuilderObjectsStructure",
        'BROWSE_UIBuilderSelectors'         :"faostat-browse-js/js/UIBuilderSelectors",
        'BROWSE_I18NInjector'               :"faostat-browse-js/js/I18NInjector",
        'BROWSE_UIBuilderByCountry'         :"faostat-browse-js/js/UIBuilderByCountry",
        'BROWSE_UIBuilderRankings'          :"faostat-browse-js/js/UIBuilderRankings",
        'BROWSE_UIBuilderTabSelector'       :"faostat-browse-js/js/UIBuilderTabSelector",
        'BROWSE_Export'                     :"faostat-browse-js/js/Export",
        'BROWSE_FAOSTATBrowseUtils'         :"faostat-browse-js/js/FAOSTATBrowseUtils",


        // Compare
        'COMPARE'                          : 'faostat-compare-js/js/faostat-compare',
        // TODO: that's a shared library
        'COMPARE_jshashtable'              : "faostat-compare-js/js/jshashtable",
        'COMPARE_CompareI18N'              : "faostat-compare-js/js/CompareI18N",
        'COMPARE_CompareI18NInjector'              : "faostat-compare-js/js/CompareI18NInjector",
        'COMPARE_CompareUIBuilderSelectors'              : "faostat-compare-js/js/CompareUIBuilderSelectors",
        'COMPARE_CompareUIBuilderChart'              : "faostat-compare-js/js/CompareUIBuilderChart",
        'COMPARE_CompareUIBuilderTable'              : "faostat-compare-js/js/CompareUIBuilderTable",
        'COMPARE_CompareUIBuilderMap'              : "faostat-compare-js/js/CompareUIBuilderMap",
        'COMPARE_CompareUIUtils'              : "faostat-compare-js/js/CompareUIUtils",
        'COMPARE_CompareUtils'              : "faostat-compare-js/js/CompareUtils",
        'COMPARE_compare-google-analytics-manager'              : "faostat-compare-js/js/compare-google-analytics-manager",

        // Search
        'SEARCH'                                            : 'faostat-search-js/js/faostat-search',
        'SEARCH_faostat-search-export'                      : "faostat-search-js/js/faostat-search-export",
        'SEARCH_faostat-search-google-analytics-manager'    : "faostat-search-js/js/faostat-search-google-analytics-manager",
        'SEARCH_faostat-search-single-result'               : "faostat-search-js/js/faostat-search-single-result",

        // Download
        'DOWNLOAD'                      : 'faostat-download-js/js/faostat-download',
        'DOWNLOAD_pivot'                : "faostat-download-js/pivotAgg/pivot",
        'DOWNLOAD_configuration'        : "faostat-download-js/pivotAgg/configuration",
        'DOWNLOAD_FBSN'                 : "faostat-download-js/FBSN",
        'DOWNLOAD_F3DWLD'               : "faostat-download-js/js/F3DWLD",
        'DOWNLOAD_F3DWLDNotes'          : "faostat-download-js/js/F3DWLDNotes",
        'DOWNLOAD_I18N'                 : "faostat-download-js/js/I18N",
        'DOWNLOAD_cpi'                  : "faostat-download-js/js/cpi",
        'DOWNLOAD_collector'            : "faostat-download-js/js/collector",
        'DOWNLOAD_faostat-download-tree'      : "faostat-download-js/js/faostat-download-tree",
        'DOWNLOAD_google-analytics-manager'   : "faostat-download-js/js/google-analytics-manager",
	"DOWNLOAD_Grid_Message":"faostat-download-js/pivotAgg/grid/gt_msg_en",
	"DOWNLOAD_Grid":"faostat-download-js/pivotAgg/grid/gt_grid_all",

        // Methods and Standards
        'MES'                           : 'faostat-mes/js/mes',
        'MES_google-analytics-manager'  : 'faostat-mes/js/google-analytics-manager',


        // Analysis
        'ANALYSIS_TILE_MANAGER' : 'tiled-analysis/js/tiles-manager/tiles-manager',
        'ANALYSIS_F3_CHART'     : 'tiled-analysis/js/libs/commons/f3-chart',
        'ANALYSIS_GHG_QA_QC'    : 'tiled-analysis/js/ghg-qa-qc/ghg-qa-qc',
        'ANALYSIS_GHG_DATA'     : 'tiled-analysis/js/ghg-data/ghg-data',
        'ANALYSIS_GHG_OVERVIEW' : 'tiled-analysis/js/ghg-overview/ghg-overview',
        'ANALYSIS_GHG_INDICATORS' : 'tiled-analysis/js/ghg-indicators/ghg-indicators',
        'F3_CHART'              : 'tiled-analysis/js/commons/f3-chart',
        'F3_GHG_TABLE'          : 'tiled-analysis/js/commons/f3-ghg-table',

	// Old analysis
	'FAOSTAT_ANALYSIS' 			: 'faostat-analysis-js/js/faostat-analysis',
        'FAOSTAT_ANALYSIS_COLLECTOR' 		: 'faostat-analysis-js/js/faostat-analysis-collector',
        'FAOSTAT_ANALYSIS_WDS_CLIENT'     	: 'faostat-analysis-js/js/wds-client',
        'FAOSTAT_ANALYSIS_GOOGLE_ANALYTICS'     : 'faostat-analysis-js/js/google-analytics-manager',
    },

    shim: {
        'highcharts_exporting': { deps :['highcharts'] },
        'FENIXChartsLibrary': { deps :['highcharts'] },

        'HOME': { deps :[
            'highcharts',
            'highcharts_exporting',
            'HOME_faostat-home-charts',
            'HOME_faostat-home-database-updates',
	    'HOME_faostat-bulk_download'
        ]},

        'BROWSE': { deps :[
            // highcharts
            'highcharts',
            'highcharts_exporting',
            'FENIXChartsLibrary',

            // browse
            'BROWSE_jshashtable',
            'BROWSE_google-analytics-manager',
            'BROWSE_faostat-browse-tree',
            'BROWSE_UIBuilder',
            'BROWSE_UIBuilderGrowthRate',
            'BROWSE_UIBuilderTable',
            'BROWSE_UIBuilderMap',
            'BROWSE_UIBuilderChart',
            'BROWSE_UIBuilderObjectsStructure',
            'BROWSE_UIBuilderSelectors',
            'BROWSE_I18NInjector',
            'BROWSE_UIBuilderByCountry',
            'BROWSE_UIBuilderRankings',
            'BROWSE_UIBuilderTabSelector',
            'BROWSE_Export',
            'BROWSE_FAOSTATBrowseUtils'
        ]},

        'SEARCH': { deps :[
            'SEARCH_faostat-search-export',
            'SEARCH_faostat-search-google-analytics-manager',
            'SEARCH_faostat-search-single-result'
        ]},

        'DOWNLOAD': { deps :[
            // download modules
            'DOWNLOAD_pivot',
            'DOWNLOAD_configuration',
            'DOWNLOAD_FBSN',
            'DOWNLOAD_F3DWLD',
            'DOWNLOAD_F3DWLDNotes',
            'DOWNLOAD_I18N',
            'DOWNLOAD_cpi',
            'DOWNLOAD_collector',
            'DOWNLOAD_faostat-download-tree',
            'DOWNLOAD_google-analytics-manager',
	    'DOWNLOAD_Grid_Message',
	    'DOWNLOAD_Grid'
        ]},

        'COMPARE': { deps :[
            'highcharts',
            'highcharts_exporting',
            'FENIXChartsLibrary',

            'COMPARE_jshashtable',
            'COMPARE_CompareI18N',
            'COMPARE_CompareI18NInjector',
            'COMPARE_CompareUIBuilderSelectors',
            'COMPARE_CompareUIBuilderChart',
            'COMPARE_CompareUIBuilderTable',
            'COMPARE_CompareUIBuilderMap',
            'COMPARE_CompareUtils',
            'COMPARE_compare-google-analytics-manager',
            'COMPARE_CompareUIUtils'
        ]},


        'MES': { deps :[
            'MES_google-analytics-manager'
        ]},

	'FAOSTAT_ANALYSIS': {deps: [
  	    'FAOSTAT_ANALYSIS_COLLECTOR',
  	    'FAOSTAT_ANALYSIS_GOOGLE_ANALYTICS',
  	    'FAOSTAT_ANALYSIS_WDS_CLIENT'
	]}
    }
});

</script>

<script>
    // $(window).on("load", function(e) {
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-29534670-1']);
        _gaq.push(['_trackPageview']);
        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
 //    });

FAOSTATGateway._loadUI({"module":"browse","code":"*","lang":"E","section":"P","lang_iso2":"EN"})
</script>
</body>
</html>