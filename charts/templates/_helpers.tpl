
{{- define "go-echoe596a93e-fdab-4916-b1ec-dd7f1d789af8.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe596a93e-fdab-4916-b1ec-dd7f1d789af8.fullname" -}}
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


{{- define "go-echoe596a93e-fdab-4916-b1ec-dd7f1d789af8.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe596a93e-fdab-4916-b1ec-dd7f1d789af8.labels" -}}
helm.sh/chart: {{ include "go-echoe596a93e-fdab-4916-b1ec-dd7f1d789af8.chart" . }}
{{ include "go-echoe596a93e-fdab-4916-b1ec-dd7f1d789af8.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe596a93e-fdab-4916-b1ec-dd7f1d789af8.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe596a93e-fdab-4916-b1ec-dd7f1d789af8.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}