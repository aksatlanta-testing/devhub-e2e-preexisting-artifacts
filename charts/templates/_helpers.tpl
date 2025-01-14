
{{- define "go-echo0249d0e9-1397-4285-9206-4a595a2a23ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0249d0e9-1397-4285-9206-4a595a2a23ed.fullname" -}}
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


{{- define "go-echo0249d0e9-1397-4285-9206-4a595a2a23ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0249d0e9-1397-4285-9206-4a595a2a23ed.labels" -}}
helm.sh/chart: {{ include "go-echo0249d0e9-1397-4285-9206-4a595a2a23ed.chart" . }}
{{ include "go-echo0249d0e9-1397-4285-9206-4a595a2a23ed.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0249d0e9-1397-4285-9206-4a595a2a23ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0249d0e9-1397-4285-9206-4a595a2a23ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}