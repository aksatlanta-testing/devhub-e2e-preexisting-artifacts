
{{- define "go-echo950aba39-d9ed-46e0-8ca8-c7c0da469609.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo950aba39-d9ed-46e0-8ca8-c7c0da469609.fullname" -}}
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


{{- define "go-echo950aba39-d9ed-46e0-8ca8-c7c0da469609.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo950aba39-d9ed-46e0-8ca8-c7c0da469609.labels" -}}
helm.sh/chart: {{ include "go-echo950aba39-d9ed-46e0-8ca8-c7c0da469609.chart" . }}
{{ include "go-echo950aba39-d9ed-46e0-8ca8-c7c0da469609.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo950aba39-d9ed-46e0-8ca8-c7c0da469609.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo950aba39-d9ed-46e0-8ca8-c7c0da469609.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}