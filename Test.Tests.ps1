Describe 'Test module' {

    It 'Works' {
        Write-HelloWorld | Should -Be 'Hello World'
    }
}