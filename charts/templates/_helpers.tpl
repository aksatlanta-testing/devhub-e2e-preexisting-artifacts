
{{- define "go-echoc7405e6d-e39c-451c-88b7-da8c65945e9e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7405e6d-e39c-451c-88b7-da8c65945e9e.fullname" -}}
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


{{- define "go-echoc7405e6d-e39c-451c-88b7-da8c65945e9e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc7405e6d-e39c-451c-88b7-da8c65945e9e.labels" -}}
helm.sh/chart: {{ include "go-echoc7405e6d-e39c-451c-88b7-da8c65945e9e.chart" . }}
{{ include "go-echoc7405e6d-e39c-451c-88b7-da8c65945e9e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc7405e6d-e39c-451c-88b7-da8c65945e9e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc7405e6d-e39c-451c-88b7-da8c65945e9e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}