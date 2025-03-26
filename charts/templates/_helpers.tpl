
{{- define "go-echo235874f3-3d03-44e9-ab99-a5d4ee1650aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo235874f3-3d03-44e9-ab99-a5d4ee1650aa.fullname" -}}
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


{{- define "go-echo235874f3-3d03-44e9-ab99-a5d4ee1650aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo235874f3-3d03-44e9-ab99-a5d4ee1650aa.labels" -}}
helm.sh/chart: {{ include "go-echo235874f3-3d03-44e9-ab99-a5d4ee1650aa.chart" . }}
{{ include "go-echo235874f3-3d03-44e9-ab99-a5d4ee1650aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo235874f3-3d03-44e9-ab99-a5d4ee1650aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo235874f3-3d03-44e9-ab99-a5d4ee1650aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}