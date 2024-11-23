
{{- define "go-echo6ed826a8-addd-4399-9eba-3026f69ff073.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ed826a8-addd-4399-9eba-3026f69ff073.fullname" -}}
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


{{- define "go-echo6ed826a8-addd-4399-9eba-3026f69ff073.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ed826a8-addd-4399-9eba-3026f69ff073.labels" -}}
helm.sh/chart: {{ include "go-echo6ed826a8-addd-4399-9eba-3026f69ff073.chart" . }}
{{ include "go-echo6ed826a8-addd-4399-9eba-3026f69ff073.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6ed826a8-addd-4399-9eba-3026f69ff073.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6ed826a8-addd-4399-9eba-3026f69ff073.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}