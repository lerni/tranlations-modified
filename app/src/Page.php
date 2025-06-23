<?php


use SilverStripe\ORM\ArrayList;
use SilverStripe\Blog\Model\Blog;
use SilverStripe\Forms\FieldList;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Control\Controller;
use SilverStripe\Blog\Model\BlogPost;
use SilverStripe\Security\Permission;
use SilverStripe\Blog\Model\BlogCategory;

class Page extends SiteTree
{

    private static $has_one = [];

    private static $many_many = [
        'PageCategories' => BlogCategory::class
    ];

    private static $table_name = 'Page';

    // $controller_name 'll make blog fail - so don't!
    // private static $controller_name  = PageController::class;

    public function getCMSFields()
    {
        $this->beforeUpdateCMSFields(function (FieldList $fields) {
            $fields->removeByName(['ExtraMeta']);

            if (!Permission::check('ADMIN') && $this->isHomePage()) {
                $fields->removeByName(['URLSegment']);
            }

            if ($TextEditor = $fields->dataFieldByName('Content')) {
                $TextEditor->setRows(30);
            }
        });

        $fields = parent::getCMSFields();

        return $fields;
    }


    public function DefaultMetaDescription()
    {
        if ($this->ClassName == 'SilverStripe\Blog\Model\BlogPost') {
            if ($this->Summary) {
                $metaDescription = strip_tags($this->Summary);
            }
        }
        if ($this->MetaDescription) {
            $metaDescription = $this->MetaDescription;
        }
        if (!isset($metaDescription)) {
            $metaDescription = $this->SiteConfig->MetaDescription;
        }
        return $metaDescription;
    }

    public function Childrenexcluded($set = 'default', $all = 0)
    {

        $conf = $this->config()->get('childrenexcluded');

        if (is_array($conf)) {
            if ($set != '' && array_key_exists($set, $conf)) {
                $exclude = $conf["$set"];
            } elseif (array_key_exists('default', $conf)) {
                $exclude = $conf['default'];
            }
        }

        if ($all) {
            $children = $this->AllChildren();
        } else {
            $children = $this->Children();
        }

        if (isset($exclude) && is_array($exclude)) {
            $children = $children->exclude('ClassName', $exclude);
        }

        return $children;
    }

    public function CategoriesWithState()
    {
        $Categories = [];
        $currentCategories = [];

        if ($this->ClassName == BlogPost::class) {
            $Categories = $this->Parent()->Categories();
            $currentCategories = $this->Categories()->Column('ID');
        } elseif ($this->ClassName == Blog::class) {
            $Categories = $this->Categories();
            if (method_exists(Controller::curr(), 'getCurrentCategory') && Controller::curr()->getCurrentCategory()) {
                $currentCategories['0'] = Controller::curr()->getCurrentCategory()->ID;
            }
        }

        $r = ArrayList::create();
        foreach ($Categories as $Cat) {
            if (in_array($Cat->ID, $currentCategories)) {
                $Cat->CustomLinkingMode = 'current';
            } else {
                $Cat->CustomLinkingMode = 'link';
            }
            $r->push($Cat);
        }
        return $r;
    }

    public function IsPreview()
    {
        if (!Controller::has_curr()) {
            return;
        }
        $controller = Controller::curr();
        $request = $controller->getRequest();
        if ($request->getVar('CMSPreview')) {
            return true;
        } else {
            return false;
        }
    }
}
