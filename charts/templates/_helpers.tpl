
{{- define "go-echo391f878e-d2d8-43ef-a54f-1318b229d801.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo391f878e-d2d8-43ef-a54f-1318b229d801.fullname" -}}
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


{{- define "go-echo391f878e-d2d8-43ef-a54f-1318b229d801.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo391f878e-d2d8-43ef-a54f-1318b229d801.labels" -}}
helm.sh/chart: {{ include "go-echo391f878e-d2d8-43ef-a54f-1318b229d801.chart" . }}
{{ include "go-echo391f878e-d2d8-43ef-a54f-1318b229d801.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo391f878e-d2d8-43ef-a54f-1318b229d801.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo391f878e-d2d8-43ef-a54f-1318b229d801.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}