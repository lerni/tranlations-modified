<?php

namespace App\Extensions;

use SilverStripe\Core\Extension;

class ElementExtension extends Extension
{
    /**
     * https://github.com/tractorcow-farm/silverstripe-fluent/issues/913#issue-2732701229
     * Fixes a bug in Elemental/Fluent, where all translations but the last one saved are marked as modified,
     * cause Fluent saves a new Version per locale.
     * @return bool
     */
    public function isLiveVersion()
    {
        return !$this->getOwner()->stagesDifferInLocale();
    }
}
