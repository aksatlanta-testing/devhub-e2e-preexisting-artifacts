
{{- define "go-echof2e27f50-6e8c-4ef5-b710-c99e18fe222f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2e27f50-6e8c-4ef5-b710-c99e18fe222f.fullname" -}}
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


{{- define "go-echof2e27f50-6e8c-4ef5-b710-c99e18fe222f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2e27f50-6e8c-4ef5-b710-c99e18fe222f.labels" -}}
helm.sh/chart: {{ include "go-echof2e27f50-6e8c-4ef5-b710-c99e18fe222f.chart" . }}
{{ include "go-echof2e27f50-6e8c-4ef5-b710-c99e18fe222f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof2e27f50-6e8c-4ef5-b710-c99e18fe222f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof2e27f50-6e8c-4ef5-b710-c99e18fe222f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}