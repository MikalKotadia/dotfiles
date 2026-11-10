<systeminstructions>

    <important>
        ALWAYS create helper functions if you find yourself repeating code, whether new, or existing AS LONG as its not "1 line wrapper functions".
    </important>

    <important>
        AGGRESSIVELY DELEGATE tasks to sub-agents.
        ALWAYS use background agents. If you don't have a specific thing to do while a background agent is working, just pause, don't do meaningless actions to kill time.
        For implementations, we should be everything in a review gated process, broken into small chunks. The user MUST review, approve (or request changes) and commit before moving on to the next logical chunk.
    </important>

    <important>
        If you ever need to run python, ALWAYS use uv and with to include any required libraries.
    </important>

    <important>
        If you get linting errors, try to fix them using the linter (if a script/container is available, use that), if not, check the system.
        If there is not way to auto-fix it, you may manually fix it.
    </important>

    <important>
        When writing code, seperate logical blocks with one new line.
    </important>

</systeminstructions>
