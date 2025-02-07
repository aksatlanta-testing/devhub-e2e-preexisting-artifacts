
{{- define "go-echo86b8c342-6c0c-466d-a739-6e23bc9edebb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo86b8c342-6c0c-466d-a739-6e23bc9edebb.fullname" -}}
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


{{- define "go-echo86b8c342-6c0c-466d-a739-6e23bc9edebb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo86b8c342-6c0c-466d-a739-6e23bc9edebb.labels" -}}
helm.sh/chart: {{ include "go-echo86b8c342-6c0c-466d-a739-6e23bc9edebb.chart" . }}
{{ include "go-echo86b8c342-6c0c-466d-a739-6e23bc9edebb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo86b8c342-6c0c-466d-a739-6e23bc9edebb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo86b8c342-6c0c-466d-a739-6e23bc9edebb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}