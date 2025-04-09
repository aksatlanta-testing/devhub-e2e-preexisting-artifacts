
{{- define "go-echoc657b6cf-98e6-44c5-adae-33424438baed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc657b6cf-98e6-44c5-adae-33424438baed.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoc657b6cf-98e6-44c5-adae-33424438baed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc657b6cf-98e6-44c5-adae-33424438baed.labels" -}}
helm.sh/chart: {{ include "go-echoc657b6cf-98e6-44c5-adae-33424438baed.chart" . }}
{{ include "go-echoc657b6cf-98e6-44c5-adae-33424438baed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc657b6cf-98e6-44c5-adae-33424438baed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc657b6cf-98e6-44c5-adae-33424438baed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}