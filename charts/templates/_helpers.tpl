
{{- define "go-echofa4279aa-5d1e-4c43-bc58-afcf73ef2840.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa4279aa-5d1e-4c43-bc58-afcf73ef2840.fullname" -}}
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


{{- define "go-echofa4279aa-5d1e-4c43-bc58-afcf73ef2840.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa4279aa-5d1e-4c43-bc58-afcf73ef2840.labels" -}}
helm.sh/chart: {{ include "go-echofa4279aa-5d1e-4c43-bc58-afcf73ef2840.chart" . }}
{{ include "go-echofa4279aa-5d1e-4c43-bc58-afcf73ef2840.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofa4279aa-5d1e-4c43-bc58-afcf73ef2840.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa4279aa-5d1e-4c43-bc58-afcf73ef2840.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}